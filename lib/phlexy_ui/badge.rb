# frozen_string_literal: true

module PhlexyUI
  class Badge < Base
    def initialize(*, as: :span, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "badge"
        component_html_class: :badge,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    private

    register_modifiers(
      # "sm:badge-neutral"
      # "@sm:badge-neutral"
      # "md:badge-neutral"
      # "@md:badge-neutral"
      # "lg:badge-neutral"
      # "@lg:badge-neutral"
      neutral: "badge-neutral",
      # "sm:badge-primary"
      # "@sm:badge-primary"
      # "md:badge-primary"
      # "@md:badge-primary"
      # "lg:badge-primary"
      # "@lg:badge-primary"
      primary: "badge-primary",
      # "sm:badge-secondary"
      # "@sm:badge-secondary"
      # "md:badge-secondary"
      # "@md:badge-secondary"
      # "lg:badge-secondary"
      # "@lg:badge-secondary"
      secondary: "badge-secondary",
      # "sm:badge-accent"
      # "@sm:badge-accent"
      # "md:badge-accent"
      # "@md:badge-accent"
      # "lg:badge-accent"
      # "@lg:badge-accent"
      accent: "badge-accent",
      # "sm:badge-ghost"
      # "@sm:badge-ghost"
      # "md:badge-ghost"
      # "@md:badge-ghost"
      # "lg:badge-ghost"
      # "@lg:badge-ghost"
      ghost: "badge-ghost",
      # "sm:badge-info"
      # "@sm:badge-info"
      # "md:badge-info"
      # "@md:badge-info"
      # "lg:badge-info"
      # "@lg:badge-info"
      info: "badge-info",
      # "sm:badge-success"
      # "@sm:badge-success"
      # "md:badge-success"
      # "@md:badge-success"
      # "lg:badge-success"
      # "@lg:badge-success"
      success: "badge-success",
      # "sm:badge-warning"
      # "@sm:badge-warning"
      # "md:badge-warning"
      # "@md:badge-warning"
      # "lg:badge-warning"
      # "@lg:badge-warning"
      warning: "badge-warning",
      # "sm:badge-error"
      # "@sm:badge-error"
      # "md:badge-error"
      # "@md:badge-error"
      # "lg:badge-error"
      # "@lg:badge-error"
      error: "badge-error",
      # "sm:badge-outline"
      # "@sm:badge-outline"
      # "md:badge-outline"
      # "@md:badge-outline"
      # "lg:badge-outline"
      # "@lg:badge-outline"
      outline: "badge-outline",
      # "sm:badge-lg"
      # "@sm:badge-lg"
      # "md:badge-lg"
      # "@md:badge-lg"
      # "lg:badge-lg"
      # "@lg:badge-lg"
      lg: "badge-lg",
      # "sm:badge-md"
      # "@sm:badge-md"
      # "md:badge-md"
      # "@md:badge-md"
      # "lg:badge-md"
      # "@lg:badge-md"
      md: "badge-md",
      # "sm:badge-sm"
      # "@sm:badge-sm"
      # "md:badge-sm"
      # "@md:badge-sm"
      # "lg:badge-sm"
      # "@lg:badge-sm"
      sm: "badge-sm",
      # "sm:badge-xs"
      # "@sm:badge-xs"
      # "md:badge-xs"
      # "@md:badge-xs"
      # "lg:badge-xs"
      # "@lg:badge-xs"
      xs: "badge-xs"
    )
  end
end
