# frozen_string_literal: true

module PhlexyUI
  class Button < Base
    CONDITIONS_CLASSES = {
      # Modifiers
      no_animation: "no-animation",
      glass: "glass",
      ghost: "btn-ghost",
      link: "btn-link",
      outline: "btn-outline",
      active: "btn-active",
      disabled: "btn-disabled",
      lg: "btn-lg",
      md: "btn-md",
      sm: "btn-sm",
      xs: "btn-xs",
      wide: "btn-wide",
      block: "btn-block",
      circle: "btn-circle",
      square: "btn-square",
      # Colors
      neutral: "btn-neutral",
      primary: "btn-primary",
      secondary: "btn-secondary",
      accent: "btn-accent",
      info: "btn-info",
      success: "btn-success",
      warning: "btn-warning",
      error: "btn-error"
    }.freeze

    BASE_HTML_CLASS = "btn"

    def view_template(&)
      button(class: classes, data:, &)
    end
  end
end
