# frozen_string_literal: true

module PhlexyUI
  # @component html class="range"
  class Range < Base
    def initialize(*, as: :input, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "range"
        component_html_class: :range,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, type: :range, class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:range-xs"
      # "@sm:range-xs"
      # "md:range-xs"
      # "@md:range-xs"
      # "lg:range-xs"
      # "@lg:range-xs"
      xs: "range-xs",
      # "sm:range-sm"
      # "@sm:range-sm"
      # "md:range-sm"
      # "@md:range-sm"
      # "lg:range-sm"
      # "@lg:range-sm"
      sm: "range-sm",
      # "sm:range-md"
      # "@sm:range-md"
      # "md:range-md"
      # "@md:range-md"
      # "lg:range-md"
      # "@lg:range-md"
      md: "range-md",
      # "sm:range-lg"
      # "@sm:range-lg"
      # "md:range-lg"
      # "@md:range-lg"
      # "lg:range-lg"
      # "@lg:range-lg"
      lg: "range-lg",
      # "sm:range-xl"
      # "@sm:range-xl"
      # "md:range-xl"
      # "@md:range-xl"
      # "lg:range-xl"
      # "@lg:range-xl"
      xl: "range-xl",
      # "sm:range-neutral"
      # "@sm:range-neutral"
      # "md:range-neutral"
      # "@md:range-neutral"
      # "lg:range-neutral"
      # "@lg:range-neutral"
      neutral: "range-neutral",
      # "sm:range-primary"
      # "@sm:range-primary"
      # "md:range-primary"
      # "@md:range-primary"
      # "lg:range-primary"
      # "@lg:range-primary"
      primary: "range-primary",
      # "sm:range-secondary"
      # "@sm:range-secondary"
      # "md:range-secondary"
      # "@md:range-secondary"
      # "lg:range-secondary"
      # "@lg:range-secondary"
      secondary: "range-secondary",
      # "sm:range-accent"
      # "@sm:range-accent"
      # "md:range-accent"
      # "@md:range-accent"
      # "lg:range-accent"
      # "@lg:range-accent"
      accent: "range-accent",
      # "sm:range-success"
      # "@sm:range-success"
      # "md:range-success"
      # "@md:range-success"
      # "lg:range-success"
      # "@lg:range-success"
      success: "range-success",
      # "sm:range-warning"
      # "@sm:range-warning"
      # "md:range-warning"
      # "@md:range-warning"
      # "lg:range-warning"
      # "@lg:range-warning"
      warning: "range-warning",
      # "sm:range-info"
      # "@sm:range-info"
      # "md:range-info"
      # "@md:range-info"
      # "lg:range-info"
      # "@lg:range-info"
      info: "range-info",
      # "sm:range-error"
      # "@sm:range-error"
      # "md:range-error"
      # "@md:range-error"
      # "lg:range-error"
      # "@lg:range-error"
      error: "range-error"
    )
  end
end
