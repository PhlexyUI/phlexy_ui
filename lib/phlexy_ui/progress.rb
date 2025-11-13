# frozen_string_literal: true

module PhlexyUI
  # @component html class="progress"
  class Progress < Base
    def initialize(*, as: :progress, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "progress"
        component_html_class: :progress,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:progress-neutral"
      # "@sm:progress-neutral"
      # "md:progress-neutral"
      # "@md:progress-neutral"
      # "lg:progress-neutral"
      # "@lg:progress-neutral"
      neutral: "progress-neutral",
      # "sm:progress-primary"
      # "@sm:progress-primary"
      # "md:progress-primary"
      # "@md:progress-primary"
      # "lg:progress-primary"
      # "@lg:progress-primary"
      primary: "progress-primary",
      # "sm:progress-secondary"
      # "@sm:progress-secondary"
      # "md:progress-secondary"
      # "@md:progress-secondary"
      # "lg:progress-secondary"
      # "@lg:progress-secondary"
      secondary: "progress-secondary",
      # "sm:progress-accent"
      # "@sm:progress-accent"
      # "md:progress-accent"
      # "@md:progress-accent"
      # "lg:progress-accent"
      # "@lg:progress-accent"
      accent: "progress-accent",
      # "sm:progress-info"
      # "@sm:progress-info"
      # "md:progress-info"
      # "@md:progress-info"
      # "lg:progress-info"
      # "@lg:progress-info"
      info: "progress-info",
      # "sm:progress-success"
      # "@sm:progress-success"
      # "md:progress-success"
      # "@md:progress-success"
      # "lg:progress-success"
      # "@lg:progress-success"
      success: "progress-success",
      # "sm:progress-warning"
      # "@sm:progress-warning"
      # "md:progress-warning"
      # "@md:progress-warning"
      # "lg:progress-warning"
      # "@lg:progress-warning"
      warning: "progress-warning",
      # "sm:progress-error"
      # "@sm:progress-error"
      # "md:progress-error"
      # "@md:progress-error"
      # "lg:progress-error"
      # "@lg:progress-error"
      error: "progress-error"
    )
  end
end
