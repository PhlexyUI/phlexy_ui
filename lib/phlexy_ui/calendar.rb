# frozen_string_literal: true

module PhlexyUI
  # @component html class="cally" or class="pika-single"
  # Supports Cally web component and Pikaday date picker
  class Calendar < Base
    # Register custom web component elements
    register_element :calendar_date
    register_element :calendar_month

    def initialize(*, type: :cally, **)
      super(*, **)
      @type = type
    end

    def view_template(&)
      case type
      when :cally
        render_cally(&)
      when :pikaday
        render_pikaday
      end
    end

    private

    attr_reader :type

    def render_cally(&block)
      generate_classes!(
        # "cally"
        component_html_class: :cally,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        calendar_date(class: classes, **options, &block)
      end
    end

    def render_pikaday
      generate_classes!(
        # "input pika-single"
        component_html_class: "input pika-single",
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        input(type: :text, class: classes, **options)
      end
    end
  end
end
