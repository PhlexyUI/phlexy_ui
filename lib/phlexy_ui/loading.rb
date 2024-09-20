# frozen_string_literal: true

module PhlexyUI
  class Loading < Base
    def initialize(*, as: :span, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :loading,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    private

    register_modifiers(
      # "sm:loading-spinner"
      # "md:loading-spinner"
      # "lg:loading-spinner"
      spinner: "loading-spinner",
      # "sm:loading-dots"
      # "md:loading-dots"
      # "lg:loading-dots"
      dots: "loading-dots",
      # "sm:loading-ring"
      # "md:loading-ring"
      # "lg:loading-ring"
      ring: "loading-ring",
      # "sm:loading-ball"
      # "md:loading-ball"
      # "lg:loading-ball"
      ball: "loading-ball",
      # "sm:loading-bars"
      # "md:loading-bars"
      # "lg:loading-bars"
      bars: "loading-bars",
      # "sm:loading-infinity"
      # "md:loading-infinity"
      # "lg:loading-infinity"
      infinity: "loading-infinity",
      # "sm:loading-xs"
      # "md:loading-xs"
      # "lg:loading-xs"
      xs: "loading-xs",
      # "sm:loading-sm"
      # "md:loading-sm"
      # "lg:loading-sm"
      sm: "loading-sm",
      # "sm:loading-md"
      # "md:loading-md"
      # "lg:loading-md"
      md: "loading-md",
      # "sm:loading-lg"
      # "md:loading-lg"
      # "lg:loading-lg"
      lg: "loading-lg",
      # "sm:text-primary"
      # "md:text-primary"
      # "lg:text-primary"
      primary: "text-primary",
      # "sm:text-secondary"
      # "md:text-secondary"
      # "lg:text-secondary"
      secondary: "text-secondary",
      # "sm:text-accent"
      # "md:text-accent"
      # "lg:text-accent"
      accent: "text-accent",
      # "sm:text-neutral"
      # "md:text-neutral"
      # "lg:text-neutral"
      neutral: "text-neutral",
      # "sm:text-info"
      # "md:text-info"
      # "lg:text-info"
      info: "text-info",
      # "sm:text-success"
      # "md:text-success"
      # "lg:text-success"
      success: "text-success",
      # "sm:text-warning"
      # "md:text-warning"
      # "lg:text-warning"
      warning: "text-warning",
      # "sm:text-error"
      # "md:text-error"
      # "lg:text-error"
      error: "text-error"
    ).freeze
  end
end
