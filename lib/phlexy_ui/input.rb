# frozen_string_literal: true

module PhlexyUI
  # @component html class="input"
  class Input < Base
    def initialize(*, as: :input, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "input"
        component_html_class: :input,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:input-ghost"
      # "@sm:input-ghost"
      # "md:input-ghost"
      # "@md:input-ghost"
      # "lg:input-ghost"
      # "@lg:input-ghost"
      ghost: "input-ghost",
      # "sm:input-xs"
      # "@sm:input-xs"
      # "md:input-xs"
      # "@md:input-xs"
      # "lg:input-xs"
      # "@lg:input-xs"
      xs: "input-xs",
      # "sm:input-sm"
      # "@sm:input-sm"
      # "md:input-sm"
      # "@md:input-sm"
      # "lg:input-sm"
      # "@lg:input-sm"
      sm: "input-sm",
      # "sm:input-md"
      # "@sm:input-md"
      # "md:input-md"
      # "@md:input-md"
      # "lg:input-md"
      # "@lg:input-md"
      md: "input-md",
      # "sm:input-lg"
      # "@sm:input-lg"
      # "md:input-lg"
      # "@md:input-lg"
      # "lg:input-lg"
      # "@lg:input-lg"
      lg: "input-lg",
      # "sm:input-xl"
      # "@sm:input-xl"
      # "md:input-xl"
      # "@md:input-xl"
      # "lg:input-xl"
      # "@lg:input-xl"
      xl: "input-xl",
      # "sm:input-neutral"
      # "@sm:input-neutral"
      # "md:input-neutral"
      # "@md:input-neutral"
      # "lg:input-neutral"
      # "@lg:input-neutral"
      neutral: "input-neutral",
      # "sm:input-primary"
      # "@sm:input-primary"
      # "md:input-primary"
      # "@md:input-primary"
      # "lg:input-primary"
      # "@lg:input-primary"
      primary: "input-primary",
      # "sm:input-secondary"
      # "@sm:input-secondary"
      # "md:input-secondary"
      # "@md:input-secondary"
      # "lg:input-secondary"
      # "@lg:input-secondary"
      secondary: "input-secondary",
      # "sm:input-accent"
      # "@sm:input-accent"
      # "md:input-accent"
      # "@md:input-accent"
      # "lg:input-accent"
      # "@lg:input-accent"
      accent: "input-accent",
      # "sm:input-info"
      # "@sm:input-info"
      # "md:input-info"
      # "@md:input-info"
      # "lg:input-info"
      # "@lg:input-info"
      info: "input-info",
      # "sm:input-success"
      # "@sm:input-success"
      # "md:input-success"
      # "@md:input-success"
      # "lg:input-success"
      # "@lg:input-success"
      success: "input-success",
      # "sm:input-warning"
      # "@sm:input-warning"
      # "md:input-warning"
      # "@md:input-warning"
      # "lg:input-warning"
      # "@lg:input-warning"
      warning: "input-warning",
      # "sm:input-error"
      # "@sm:input-error"
      # "md:input-error"
      # "@md:input-error"
      # "lg:input-error"
      # "@lg:input-error"
      error: "input-error"
    )
  end
end
