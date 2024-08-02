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
  end
end
