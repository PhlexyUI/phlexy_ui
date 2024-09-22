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
    end

    def to_a
      classes = []
      add_component_class(classes)
      add_selected_modifiers_classes(classes)
      add_conditioned_modifiers_classes(classes)
      add_responsive_modifiers_classes(classes)
      add_class_option_classes(classes)
      classes
    end

    private

    attr_reader :component_html_class, :base_modifiers, :options, :modifiers_map

    def selected_base_modifiers
      base_modifiers.select { |modifier| modifiers_map.key?(modifier) }
    end

    def add_component_class(classes)
      return unless component_html_class

      classes << with_config_prefix(component_html_class)
    end

    def add_selected_modifiers_classes(classes)
      classes.concat(
        html_classes_for_modifiers(
          selected_base_modifiers
        )
      )
    end

    def add_conditioned_modifiers_classes(classes)
      modifiers_map.each do |modifier, class_name|
        next unless options.delete(modifier)

        classes << with_config_prefix(class_name)
      end
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

    def add_responsive_modifiers_classes(classes)
      return unless (responsive_options = options.delete(:responsive))

      RESPONSIVE_PREFIXES.each do |responsive_prefix|
        if (values = responsive_options[responsive_prefix])
          classes.concat(
            html_classes_for_modifiers(
              Array(values),
              responsive_prefix:
            )
          )
        end
      end
    end

    def add_class_option_classes(classes)
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
