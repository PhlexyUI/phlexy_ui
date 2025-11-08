# frozen_string_literal: true

module PhlexyUI
  # @component html class="textarea"
  class Textarea < Base
    def initialize(*, as: :textarea, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "textarea"
        component_html_class: :textarea,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:textarea-ghost"
      # "@sm:textarea-ghost"
      # "md:textarea-ghost"
      # "@md:textarea-ghost"
      # "lg:textarea-ghost"
      # "@lg:textarea-ghost"
      ghost: "textarea-ghost",
      # "sm:textarea-xs"
      # "@sm:textarea-xs"
      # "md:textarea-xs"
      # "@md:textarea-xs"
      # "lg:textarea-xs"
      # "@lg:textarea-xs"
      xs: "textarea-xs",
      # "sm:textarea-sm"
      # "@sm:textarea-sm"
      # "md:textarea-sm"
      # "@md:textarea-sm"
      # "lg:textarea-sm"
      # "@lg:textarea-sm"
      sm: "textarea-sm",
      # "sm:textarea-md"
      # "@sm:textarea-md"
      # "md:textarea-md"
      # "@md:textarea-md"
      # "lg:textarea-md"
      # "@lg:textarea-md"
      md: "textarea-md",
      # "sm:textarea-lg"
      # "@sm:textarea-lg"
      # "md:textarea-lg"
      # "@md:textarea-lg"
      # "lg:textarea-lg"
      # "@lg:textarea-lg"
      lg: "textarea-lg",
      # "sm:textarea-xl"
      # "@sm:textarea-xl"
      # "md:textarea-xl"
      # "@md:textarea-xl"
      # "lg:textarea-xl"
      # "@lg:textarea-xl"
      xl: "textarea-xl",
      # "sm:textarea-neutral"
      # "@sm:textarea-neutral"
      # "md:textarea-neutral"
      # "@md:textarea-neutral"
      # "lg:textarea-neutral"
      # "@lg:textarea-neutral"
      neutral: "textarea-neutral",
      # "sm:textarea-primary"
      # "@sm:textarea-primary"
      # "md:textarea-primary"
      # "@md:textarea-primary"
      # "lg:textarea-primary"
      # "@lg:textarea-primary"
      primary: "textarea-primary",
      # "sm:textarea-secondary"
      # "@sm:textarea-secondary"
      # "md:textarea-secondary"
      # "@md:textarea-secondary"
      # "lg:textarea-secondary"
      # "@lg:textarea-secondary"
      secondary: "textarea-secondary",
      # "sm:textarea-accent"
      # "@sm:textarea-accent"
      # "md:textarea-accent"
      # "@md:textarea-accent"
      # "lg:textarea-accent"
      # "@lg:textarea-accent"
      accent: "textarea-accent",
      # "sm:textarea-info"
      # "@sm:textarea-info"
      # "md:textarea-info"
      # "@md:textarea-info"
      # "lg:textarea-info"
      # "@lg:textarea-info"
      info: "textarea-info",
      # "sm:textarea-success"
      # "@sm:textarea-success"
      # "md:textarea-success"
      # "@md:textarea-success"
      # "lg:textarea-success"
      # "@lg:textarea-success"
      success: "textarea-success",
      # "sm:textarea-warning"
      # "@sm:textarea-warning"
      # "md:textarea-warning"
      # "@md:textarea-warning"
      # "lg:textarea-warning"
      # "@lg:textarea-warning"
      warning: "textarea-warning",
      # "sm:textarea-error"
      # "@sm:textarea-error"
      # "md:textarea-error"
      # "@md:textarea-error"
      # "lg:textarea-error"
      # "@lg:textarea-error"
      error: "textarea-error"
    )
  end
end
