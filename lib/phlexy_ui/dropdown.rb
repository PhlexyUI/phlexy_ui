# frozen_string_literal: true

module PhlexyUI
  class Dropdown < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "dropdown"
        component_html_class: :dropdown,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        if base_modifiers.include?(:tap_to_close)
          details(class: classes, **options, &)
        else
          public_send(as, class: classes, **options, &)
        end
      end
    end

    def button(*, **, &)
      if base_modifiers.include?(:tap_to_close)
        render Button.new(*, as: :summary, **, &)
      else
        render Button.new(*, as: :div, role: :button, tabindex: 0, **, &)
      end
    end

    def content(*, as: :div, **options, &)
      generate_classes!(
        # "dropdown-content"
        component_html_class: :"dropdown-content",
        options:
      ).then do |classes|
        if base_modifiers.include?(:tap_to_close)
          render_as(*, as:, class: classes, **options, &)
        else
          render_as(*, as:, tabindex: 0, class: classes, **options, &)
        end
      end
    end

    def menu(*, **options, &)
      generate_classes!(
        # "dropdown-content"
        component_html_class: :"dropdown-content",
        options:
      ).then do |classes|
        if base_modifiers.include?(:tap_to_close)
          render Menu.new(*, class: classes, **options, &)
        else
          render Menu.new(*, tabindex: 0, class: classes, **options, &)
        end
      end
    end

    private

    register_modifiers(
        # "sm:dropdown-end"
        # "@sm:dropdown-end"
        # "md:dropdown-end"
        # "@md:dropdown-end"
        # "lg:dropdown-end"
        # "@lg:dropdown-end"
      end: "dropdown-end",
      # "sm:dropdown-top"
      # "@sm:dropdown-top"
      # "md:dropdown-top"
      # "@md:dropdown-top"
      # "lg:dropdown-top"
      # "@lg:dropdown-top"
      top: "dropdown-top",
      # "sm:dropdown-bottom"
      # "@sm:dropdown-bottom"
      # "md:dropdown-bottom"
      # "@md:dropdown-bottom"
      # "lg:dropdown-bottom"
      # "@lg:dropdown-bottom"
      bottom: "dropdown-bottom",
      # "sm:dropdown-left"
      # "@sm:dropdown-left"
      # "md:dropdown-left"
      # "@md:dropdown-left"
      # "lg:dropdown-left"
      # "@lg:dropdown-left"
      left: "dropdown-left",
      # "sm:dropdown-right"
      # "@sm:dropdown-right"
      # "md:dropdown-right"
      # "@md:dropdown-right"
      # "lg:dropdown-right"
      # "@lg:dropdown-right"
      right: "dropdown-right",
      # "sm:dropdown-hover"
      # "@sm:dropdown-hover"
      # "md:dropdown-hover"
      # "@md:dropdown-hover"
      # "lg:dropdown-hover"
      # "@lg:dropdown-hover"
      hover: "dropdown-hover",
      # "sm:dropdown-open"
      # "@sm:dropdown-open"
      # "md:dropdown-open"
      # "@md:dropdown-open"
      # "lg:dropdown-open"
      # "@lg:dropdown-open"
      open: "dropdown-open"
    )
  end
end
