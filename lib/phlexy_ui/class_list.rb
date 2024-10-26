require "debug"

module PhlexyUI
  class ClassList
    RESPONSIVE_PREFIXES = %i[sm md lg xl].freeze

    def initialize(
      component:,
      component_html_class: nil,
      base_modifiers: [],
      options: {},
      modifiers_map: {}
    )
      @component_html_class = component_html_class
      @base_modifiers = base_modifiers
      @options = options
      @modifiers_map = modifiers_map
      @responsive_options = options.delete(:responsive)
    end

    def to_a
      [
        component_classes,
        modifier_classes,
        responsive_classes,
        options.delete(:class)
      ].flatten.compact
    end

    private

    attr_reader :component_html_class,
      :base_modifiers,
      :options,
      :modifiers_map,
      :responsive_options

    def component_classes
      return unless component_html_class
      return if responsive_options&.values&.any? do |v|
        v == true || (v.is_a?(Array) && v.include?(true))
      end

      with_config_prefix(component_html_class)
    end

    def modifier_classes
      (selected_base_modifiers + conditioned_modifiers).map do |modifier|
        with_config_prefix(modifiers_map[modifier])
      end
    end

    def selected_base_modifiers
      base_modifiers.select { |modifier| modifiers_map.key?(modifier) }
    end

    def conditioned_modifiers
      modifiers_map.keys.select { |modifier| options.delete(modifier) }
    end

    def responsive_classes
      return unless responsive_options

      RESPONSIVE_PREFIXES.flat_map do |prefix|
        next unless responsive_options[prefix]

        values = Array(responsive_options[prefix])

        component_responsive_class =
          if values.delete(true)
            [with_responsive_prefix(with_config_prefix(component_html_class), prefix)]
          else
            []
          end

        modifier_responsive_classes = values.map do |v|
          with_responsive_prefix(with_config_prefix(modifiers_map[v]), prefix)
        end

        component_responsive_class + modifier_responsive_classes
      end
    end

    def with_config_prefix(string)
      string.to_s.split.map do |word|
        "#{PhlexyUI.configuration.prefix}#{word}"
      end.join(" ")
    end

    def with_responsive_prefix(string, prefix)
      string.to_s.split.map { |word| "#{prefix}:#{word}" }.join(" ")
    end
  end
end
