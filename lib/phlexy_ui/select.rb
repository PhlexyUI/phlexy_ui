# frozen_string_literal: true

module PhlexyUI
  # @component html class="select"
  class Select < Base
    def initialize(*, as: :select, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "select"
        component_html_class: :select,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:select-ghost"
      # "@sm:select-ghost"
      # "md:select-ghost"
      # "@md:select-ghost"
      # "lg:select-ghost"
      # "@lg:select-ghost"
      ghost: "select-ghost",
      # "sm:select-xs"
      # "@sm:select-xs"
      # "md:select-xs"
      # "@md:select-xs"
      # "lg:select-xs"
      # "@lg:select-xs"
      xs: "select-xs",
      # "sm:select-sm"
      # "@sm:select-sm"
      # "md:select-sm"
      # "@md:select-sm"
      # "lg:select-sm"
      # "@lg:select-sm"
      sm: "select-sm",
      # "sm:select-md"
      # "@sm:select-md"
      # "md:select-md"
      # "@md:select-md"
      # "lg:select-md"
      # "@lg:select-md"
      md: "select-md",
      # "sm:select-lg"
      # "@sm:select-lg"
      # "md:select-lg"
      # "@md:select-lg"
      # "lg:select-lg"
      # "@lg:select-lg"
      lg: "select-lg",
      # "sm:select-xl"
      # "@sm:select-xl"
      # "md:select-xl"
      # "@md:select-xl"
      # "lg:select-xl"
      # "@lg:select-xl"
      xl: "select-xl",
      # "sm:select-neutral"
      # "@sm:select-neutral"
      # "md:select-neutral"
      # "@md:select-neutral"
      # "lg:select-neutral"
      # "@lg:select-neutral"
      neutral: "select-neutral",
      # "sm:select-primary"
      # "@sm:select-primary"
      # "md:select-primary"
      # "@md:select-primary"
      # "lg:select-primary"
      # "@lg:select-primary"
      primary: "select-primary",
      # "sm:select-secondary"
      # "@sm:select-secondary"
      # "md:select-secondary"
      # "@md:select-secondary"
      # "lg:select-secondary"
      # "@lg:select-secondary"
      secondary: "select-secondary",
      # "sm:select-accent"
      # "@sm:select-accent"
      # "md:select-accent"
      # "@md:select-accent"
      # "lg:select-accent"
      # "@lg:select-accent"
      accent: "select-accent",
      # "sm:select-info"
      # "@sm:select-info"
      # "md:select-info"
      # "@md:select-info"
      # "lg:select-info"
      # "@lg:select-info"
      info: "select-info",
      # "sm:select-success"
      # "@sm:select-success"
      # "md:select-success"
      # "@md:select-success"
      # "lg:select-success"
      # "@lg:select-success"
      success: "select-success",
      # "sm:select-warning"
      # "@sm:select-warning"
      # "md:select-warning"
      # "@md:select-warning"
      # "lg:select-warning"
      # "@lg:select-warning"
      warning: "select-warning",
      # "sm:select-error"
      # "@sm:select-error"
      # "md:select-error"
      # "@md:select-error"
      # "lg:select-error"
      # "@lg:select-error"
      error: "select-error"
    )
  end
end
