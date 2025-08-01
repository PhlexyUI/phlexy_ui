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
      # "@sm:loading-spinner"
      # "md:loading-spinner"
      # "@md:loading-spinner"
      # "lg:loading-spinner"
      # "@lg:loading-spinner"
      spinner: "loading-spinner",
      # "sm:loading-dots"
      # "@sm:loading-dots"
      # "md:loading-dots"
      # "@md:loading-dots"
      # "lg:loading-dots"
      # "@lg:loading-dots"
      dots: "loading-dots",
      # "sm:loading-ring"
      # "@sm:loading-ring"
      # "md:loading-ring"
      # "@md:loading-ring"
      # "lg:loading-ring"
      # "@lg:loading-ring"
      ring: "loading-ring",
      # "sm:loading-ball"
      # "@sm:loading-ball"
      # "md:loading-ball"
      # "@md:loading-ball"
      # "lg:loading-ball"
      # "@lg:loading-ball"
      ball: "loading-ball",
      # "sm:loading-bars"
      # "@sm:loading-bars"
      # "md:loading-bars"
      # "@md:loading-bars"
      # "lg:loading-bars"
      # "@lg:loading-bars"
      bars: "loading-bars",
      # "sm:loading-infinity"
      # "@sm:loading-infinity"
      # "md:loading-infinity"
      # "@md:loading-infinity"
      # "lg:loading-infinity"
      # "@lg:loading-infinity"
      infinity: "loading-infinity",
      # "sm:loading-xs"
      # "@sm:loading-xs"
      # "md:loading-xs"
      # "@md:loading-xs"
      # "lg:loading-xs"
      # "@lg:loading-xs"
      xs: "loading-xs",
      # "sm:loading-sm"
      # "@sm:loading-sm"
      # "md:loading-sm"
      # "@md:loading-sm"
      # "lg:loading-sm"
      # "@lg:loading-sm"
      sm: "loading-sm",
      # "sm:loading-md"
      # "@sm:loading-md"
      # "md:loading-md"
      # "@md:loading-md"
      # "lg:loading-md"
      # "@lg:loading-md"
      md: "loading-md",
      # "sm:loading-lg"
      # "@sm:loading-lg"
      # "md:loading-lg"
      # "@md:loading-lg"
      # "lg:loading-lg"
      # "@lg:loading-lg"
      lg: "loading-lg",
      # "sm:text-primary"
      # "@sm:text-primary"
      # "md:text-primary"
      # "@md:text-primary"
      # "lg:text-primary"
      # "@lg:text-primary"
      primary: "text-primary",
      # "sm:text-secondary"
      # "@sm:text-secondary"
      # "md:text-secondary"
      # "@md:text-secondary"
      # "lg:text-secondary"
      # "@lg:text-secondary"
      secondary: "text-secondary",
      # "sm:text-accent"
      # "@sm:text-accent"
      # "md:text-accent"
      # "@md:text-accent"
      # "lg:text-accent"
      # "@lg:text-accent"
      accent: "text-accent",
      # "sm:text-neutral"
      # "@sm:text-neutral"
      # "md:text-neutral"
      # "@md:text-neutral"
      # "lg:text-neutral"
      # "@lg:text-neutral"
      neutral: "text-neutral",
      # "sm:text-info"
      # "@sm:text-info"
      # "md:text-info"
      # "@md:text-info"
      # "lg:text-info"
      # "@lg:text-info"
      info: "text-info",
      # "sm:text-success"
      # "@sm:text-success"
      # "md:text-success"
      # "@md:text-success"
      # "lg:text-success"
      # "@lg:text-success"
      success: "text-success",
      # "sm:text-warning"
      # "@sm:text-warning"
      # "md:text-warning"
      # "@md:text-warning"
      # "lg:text-warning"
      # "@lg:text-warning"
      warning: "text-warning",
      # "sm:text-error"
      # "@sm:text-error"
      # "md:text-error"
      # "@md:text-error"
      # "lg:text-error"
      # "@lg:text-error"
      error: "text-error"
    ).freeze
  end
end
