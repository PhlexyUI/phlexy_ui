# frozen_string_literal: true

module PhlexyUI
  class Button < Base
    def initialize(*, as: :button, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :btn,
        modifiers_map: BUTTON_MODIFIERS_MAP,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    private

    BUTTON_MODIFIERS_MAP = {
      # Modifiers
      # "sm:no-animation"
      # "md:no-animation"
      # "lg:no-animation"
      no_animation: "no-animation",
      # "sm:glass"
      # "md:glass"
      # "lg:glass"
      glass: "glass",
      # "sm:btn-ghost"
      # "md:btn-ghost"
      # "lg:btn-ghost"
      ghost: "btn-ghost",
      # "sm:btn-link"
      # "md:btn-link"
      # "lg:btn-link"
      link: "btn-link",
      # "sm:btn-outline"
      # "md:btn-outline"
      # "lg:btn-outline"
      outline: "btn-outline",
      # "sm:btn-active"
      # "md:btn-active"
      # "lg:btn-active"
      active: "btn-active",
      # "sm:btn-disabled"
      # "md:btn-disabled"
      # "lg:btn-disabled"
      disabled: "btn-disabled",
      # "sm:btn-lg"
      # "md:btn-lg"
      # "lg:btn-lg"
      lg: "btn-lg",
      # "sm:btn-md"
      # "md:btn-md"
      # "lg:btn-md"
      md: "btn-md",
      # "sm:btn-sm"
      # "md:btn-sm"
      # "lg:btn-sm"
      sm: "btn-sm",
      # "sm:btn-xs"
      # "md:btn-xs"
      # "lg:btn-xs"
      xs: "btn-xs",
      # "sm:btn-wide"
      # "md:btn-wide"
      # "lg:btn-wide"
      wide: "btn-wide",
      # "sm:btn-block"
      # "md:btn-block"
      # "lg:btn-block"
      block: "btn-block",
      # "sm:btn-circle"
      # "md:btn-circle"
      # "lg:btn-circle"
      circle: "btn-circle",
      # "sm:btn-square"
      # "md:btn-square"
      # "lg:btn-square"
      square: "btn-square",
      # Colors
      # "sm:btn-neutral"
      # "md:btn-neutral"
      # "lg:btn-neutral"
      neutral: "btn-neutral",
      # "sm:btn-primary"
      # "md:btn-primary"
      # "lg:btn-primary"
      primary: "btn-primary",
      # "sm:btn-secondary"
      # "md:btn-secondary"
      # "lg:btn-secondary"
      secondary: "btn-secondary",
      # "sm:btn-accent"
      # "md:btn-accent"
      # "lg:btn-accent"
      accent: "btn-accent",
      # "sm:btn-info"
      # "md:btn-info"
      # "lg:btn-info"
      info: "btn-info",
      # "sm:btn-success"
      # "md:btn-success"
      # "lg:btn-success"
      success: "btn-success",
      # "sm:btn-warning"
      # "md:btn-warning"
      # "lg:btn-warning"
      warning: "btn-warning",
      # "sm:btn-error"
      # "md:btn-error"
      # "lg:btn-error"
      error: "btn-error"
    }.freeze
  end
end
