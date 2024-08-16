# frozen_string_literal: true

module PhlexyUI
  class Base < Phlex::HTML
    RESPONSIVE_PREFIXES = %i[sm md lg].freeze

    def initialize(*base_modifiers, **options)
      @base_modifiers = base_modifiers
      @options = options
    end

    private

    attr_reader :base_modifiers, :options, :as, :id

    def generate_classes!(
      component_html_class: nil,
      base_modifiers: [],
      options: {},
      modifiers_map: {}
    )
      [].then do |classes|
        if component_html_class
          classes << with_config_prefix(component_html_class)
        end

        classes.concat(html_classes_for_modifiers(base_modifiers, modifiers_map))
        classes.concat(responsive_html_classes_for_modifiers!(options, modifiers_map))
        classes << options.delete(:class) if options[:class]
        classes.any? ? classes : nil
      end
    end

    def responsive_html_classes_for_modifiers!(options, modifiers_map)
      options_to_responsive_modifiers_hash!(options).flat_map do |responsive_prefix, modifiers|
        html_classes_for_modifiers(modifiers, modifiers_map, responsive_prefix:)
      end
    end

    def options_to_responsive_modifiers_hash!(options)
      RESPONSIVE_PREFIXES.to_h do |responsive_prefix|
        [responsive_prefix, Array(options.delete(responsive_prefix))]
      end
    end

    def html_classes_for_modifiers(modifiers, modifiers_map, responsive_prefix: nil)
      modifiers.map do |modifier|
        with_responsive_prefix(
          with_config_prefix(modifiers_map.fetch(modifier)),
          responsive_prefix:
        )
      end
    rescue KeyError => e
      raise ArgumentError, "Modifier `#{e.key}` is not defined for #{self.class}"
    end

    def with_config_prefix(string)
      "#{PhlexyUI.configuration.prefix}#{string}"
    end

    def with_responsive_prefix(string, responsive_prefix: nil)
      responsive_prefix ? "#{responsive_prefix}:#{string}" : string
    end
  end
end
