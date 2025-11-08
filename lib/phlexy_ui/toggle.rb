# frozen_string_literal: true

module PhlexyUI
  # @component html class="toggle"
  class Toggle < Base
    def initialize(*, as: :input, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "toggle"
        component_html_class: :toggle,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, type: :checkbox, class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:toggle-xs"
      # "@sm:toggle-xs"
      # "md:toggle-xs"
      # "@md:toggle-xs"
      # "lg:toggle-xs"
      # "@lg:toggle-xs"
      xs: "toggle-xs",
      # "sm:toggle-sm"
      # "@sm:toggle-sm"
      # "md:toggle-sm"
      # "@md:toggle-sm"
      # "lg:toggle-sm"
      # "@lg:toggle-sm"
      sm: "toggle-sm",
      # "sm:toggle-md"
      # "@sm:toggle-md"
      # "md:toggle-md"
      # "@md:toggle-md"
      # "lg:toggle-md"
      # "@lg:toggle-md"
      md: "toggle-md",
      # "sm:toggle-lg"
      # "@sm:toggle-lg"
      # "md:toggle-lg"
      # "@md:toggle-lg"
      # "lg:toggle-lg"
      # "@lg:toggle-lg"
      lg: "toggle-lg",
      # "sm:toggle-xl"
      # "@sm:toggle-xl"
      # "md:toggle-xl"
      # "@md:toggle-xl"
      # "lg:toggle-xl"
      # "@lg:toggle-xl"
      xl: "toggle-xl",
      # "sm:toggle-primary"
      # "@sm:toggle-primary"
      # "md:toggle-primary"
      # "@md:toggle-primary"
      # "lg:toggle-primary"
      # "@lg:toggle-primary"
      primary: "toggle-primary",
      # "sm:toggle-secondary"
      # "@sm:toggle-secondary"
      # "md:toggle-secondary"
      # "@md:toggle-secondary"
      # "lg:toggle-secondary"
      # "@lg:toggle-secondary"
      secondary: "toggle-secondary",
      # "sm:toggle-accent"
      # "@sm:toggle-accent"
      # "md:toggle-accent"
      # "@md:toggle-accent"
      # "lg:toggle-accent"
      # "@lg:toggle-accent"
      accent: "toggle-accent",
      # "sm:toggle-neutral"
      # "@sm:toggle-neutral"
      # "md:toggle-neutral"
      # "@md:toggle-neutral"
      # "lg:toggle-neutral"
      # "@lg:toggle-neutral"
      neutral: "toggle-neutral",
      # "sm:toggle-success"
      # "@sm:toggle-success"
      # "md:toggle-success"
      # "@md:toggle-success"
      # "lg:toggle-success"
      # "@lg:toggle-success"
      success: "toggle-success",
      # "sm:toggle-warning"
      # "@sm:toggle-warning"
      # "md:toggle-warning"
      # "@md:toggle-warning"
      # "lg:toggle-warning"
      # "@lg:toggle-warning"
      warning: "toggle-warning",
      # "sm:toggle-info"
      # "@sm:toggle-info"
      # "md:toggle-info"
      # "@md:toggle-info"
      # "lg:toggle-info"
      # "@lg:toggle-info"
      info: "toggle-info",
      # "sm:toggle-error"
      # "@sm:toggle-error"
      # "md:toggle-error"
      # "@md:toggle-error"
      # "lg:toggle-error"
      # "@lg:toggle-error"
      error: "toggle-error"
    )
  end
end
