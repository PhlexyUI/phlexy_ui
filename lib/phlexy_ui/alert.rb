# frozen_string_literal: true

module PhlexyUI
  class Alert < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "alert"
        component_html_class: :alert,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, role: :alert, class: classes, **options, &)
      end
    end

    private

    register_modifiers(
      # "sm:alert-info"
      # "@sm:alert-info"
      # "md:alert-info"
      # "@md:alert-info"
      # "lg:alert-info"
      # "@lg:alert-info"
      info: "alert-info",
      # "sm:alert-success"
      # "@sm:alert-success"
      # "md:alert-success"
      # "@md:alert-success"
      # "lg:alert-success"
      # "@lg:alert-success"
      success: "alert-success",
      # "sm:alert-warning"
      # "@sm:alert-warning"
      # "md:alert-warning"
      # "@md:alert-warning"
      # "lg:alert-warning"
      # "@lg:alert-warning"
      warning: "alert-warning",
      # "sm:alert-error"
      # "@sm:alert-error"
      # "md:alert-error"
      # "@md:alert-error"
      # "lg:alert-error"
      # "@lg:alert-error"
      error: "alert-error",
      # "sm:alert-neutral"
      # "@sm:alert-neutral"
      # "md:alert-neutral"
      # "@md:alert-neutral"
      # "lg:alert-neutral"
      # "@lg:alert-neutral"
      neutral: "alert-neutral",
      # "sm:alert-primary"
      # "@sm:alert-primary"
      # "md:alert-primary"
      # "@md:alert-primary"
      # "lg:alert-primary"
      # "@lg:alert-primary"
      primary: "alert-primary",
      # "sm:alert-secondary"
      # "@sm:alert-secondary"
      # "md:alert-secondary"
      # "@md:alert-secondary"
      # "lg:alert-secondary"
      # "@lg:alert-secondary"
      secondary: "alert-secondary",
      # "sm:alert-accent"
      # "@sm:alert-accent"
      # "md:alert-accent"
      # "@md:alert-accent"
      # "lg:alert-accent"
      # "@lg:alert-accent"
      accent: "alert-accent"
    )
  end
end
