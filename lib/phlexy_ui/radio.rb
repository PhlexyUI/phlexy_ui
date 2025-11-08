# frozen_string_literal: true

module PhlexyUI
  # @component html class="radio"
  class Radio < Base
    def initialize(*, as: :input, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "radio"
        component_html_class: :radio,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, type: :radio, class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:radio-xs"
      # "@sm:radio-xs"
      # "md:radio-xs"
      # "@md:radio-xs"
      # "lg:radio-xs"
      # "@lg:radio-xs"
      xs: "radio-xs",
      # "sm:radio-sm"
      # "@sm:radio-sm"
      # "md:radio-sm"
      # "@md:radio-sm"
      # "lg:radio-sm"
      # "@lg:radio-sm"
      sm: "radio-sm",
      # "sm:radio-md"
      # "@sm:radio-md"
      # "md:radio-md"
      # "@md:radio-md"
      # "lg:radio-md"
      # "@lg:radio-md"
      md: "radio-md",
      # "sm:radio-lg"
      # "@sm:radio-lg"
      # "md:radio-lg"
      # "@md:radio-lg"
      # "lg:radio-lg"
      # "@lg:radio-lg"
      lg: "radio-lg",
      # "sm:radio-xl"
      # "@sm:radio-xl"
      # "md:radio-xl"
      # "@md:radio-xl"
      # "lg:radio-xl"
      # "@lg:radio-xl"
      xl: "radio-xl",
      # "sm:radio-neutral"
      # "@sm:radio-neutral"
      # "md:radio-neutral"
      # "@md:radio-neutral"
      # "lg:radio-neutral"
      # "@lg:radio-neutral"
      neutral: "radio-neutral",
      # "sm:radio-primary"
      # "@sm:radio-primary"
      # "md:radio-primary"
      # "@md:radio-primary"
      # "lg:radio-primary"
      # "@lg:radio-primary"
      primary: "radio-primary",
      # "sm:radio-secondary"
      # "@sm:radio-secondary"
      # "md:radio-secondary"
      # "@md:radio-secondary"
      # "lg:radio-secondary"
      # "@lg:radio-secondary"
      secondary: "radio-secondary",
      # "sm:radio-accent"
      # "@sm:radio-accent"
      # "md:radio-accent"
      # "@md:radio-accent"
      # "lg:radio-accent"
      # "@lg:radio-accent"
      accent: "radio-accent",
      # "sm:radio-success"
      # "@sm:radio-success"
      # "md:radio-success"
      # "@md:radio-success"
      # "lg:radio-success"
      # "@lg:radio-success"
      success: "radio-success",
      # "sm:radio-warning"
      # "@sm:radio-warning"
      # "md:radio-warning"
      # "@md:radio-warning"
      # "lg:radio-warning"
      # "@lg:radio-warning"
      warning: "radio-warning",
      # "sm:radio-info"
      # "@sm:radio-info"
      # "md:radio-info"
      # "@md:radio-info"
      # "lg:radio-info"
      # "@lg:radio-info"
      info: "radio-info",
      # "sm:radio-error"
      # "@sm:radio-error"
      # "md:radio-error"
      # "@md:radio-error"
      # "lg:radio-error"
      # "@lg:radio-error"
      error: "radio-error"
    )
  end
end
