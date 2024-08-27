module PhlexyUI
  class ClassList
    RESPONSIVE_PREFIXES = %i[sm md lg].freeze

    def initialize(component_html_class: nil, base_modifiers: [], options: {}, modifiers_map: {})
      @component_html_class = component_html_class
      @base_modifiers = base_modifiers
      @options = options
      @modifiers_map = modifiers_map
    end

    def to_a
      classes = []
      add_component_class(classes)
      add_base_classes(classes)
      add_responsive_classes(classes)
      add_user_classes(classes)
      classes
    end

    private

    attr_reader :component_html_class, :base_modifiers, :options, :modifiers_map

    def classes_modifiers
      base_modifiers.select { |modifier| modifiers_map.key?(modifier) }
    end

    def add_component_class(classes)
      return unless component_html_class

      classes << with_config_prefix(component_html_class)
    end

    def add_base_classes(classes)
      classes.concat(html_classes_for_modifiers(classes_modifiers))
    end

    def html_classes_for_modifiers(modifiers, responsive_prefix: nil)
      modifiers.map do |modifier|
        with_responsive_prefix(
          with_config_prefix(
            modifiers_map.fetch(modifier)
          ),
          responsive_prefix
        )
      end
    end

    def add_responsive_classes(classes)
      RESPONSIVE_PREFIXES.each do |responsive_prefix|
        if (values = options.delete(responsive_prefix))
          classes.concat(
            html_classes_for_modifiers(
              Array(values),
              responsive_prefix:
            )
          )
        end
      end
    end

    def add_user_classes(classes)
      classes << options.delete(:class) if options[:class]
    end

    def with_config_prefix(string)
      string.to_s.split.map do |word|
        "#{PhlexyUI.configuration.prefix}#{word}"
      end.join(" ")
    end

    def with_responsive_prefix(string, responsive_prefix = nil)
      string.split.map do |word|
        if responsive_prefix
          "#{responsive_prefix}:#{word}"
        else
          word
        end
      end.join(" ")
    end
  end
end
