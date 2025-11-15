# frozen_string_literal: true

module PhlexyUI
  # @component html class="steps"
  class Steps < Base
    def initialize(*, as: :ul, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "steps"
        component_html_class: :steps,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def step(*modifiers, **options, &)
      generate_classes!(
        # "step"
        component_html_class: :step,
        modifiers_map: step_modifiers,
        base_modifiers: modifiers,
        options:
      ).then do |classes|
        li(class: classes, **options, &)
      end
    end

    def step_modifiers
      {
        # "sm:step-neutral"
        # "@sm:step-neutral"
        # "md:step-neutral"
        # "@md:step-neutral"
        # "lg:step-neutral"
        # "@lg:step-neutral"
        neutral: "step-neutral",
        # "sm:step-primary"
        # "@sm:step-primary"
        # "md:step-primary"
        # "@md:step-primary"
        # "lg:step-primary"
        # "@lg:step-primary"
        primary: "step-primary",
        # "sm:step-secondary"
        # "@sm:step-secondary"
        # "md:step-secondary"
        # "@md:step-secondary"
        # "lg:step-secondary"
        # "@lg:step-secondary"
        secondary: "step-secondary",
        # "sm:step-accent"
        # "@sm:step-accent"
        # "md:step-accent"
        # "@md:step-accent"
        # "lg:step-accent"
        # "@lg:step-accent"
        accent: "step-accent",
        # "sm:step-info"
        # "@sm:step-info"
        # "md:step-info"
        # "@md:step-info"
        # "lg:step-info"
        # "@lg:step-info"
        info: "step-info",
        # "sm:step-success"
        # "@sm:step-success"
        # "md:step-success"
        # "@md:step-success"
        # "lg:step-success"
        # "@lg:step-success"
        success: "step-success",
        # "sm:step-warning"
        # "@sm:step-warning"
        # "md:step-warning"
        # "@md:step-warning"
        # "lg:step-warning"
        # "@lg:step-warning"
        warning: "step-warning",
        # "sm:step-error"
        # "@sm:step-error"
        # "md:step-error"
        # "@md:step-error"
        # "lg:step-error"
        # "@lg:step-error"
        error: "step-error"
      }
    end

    def icon(**options, &)
      generate_classes!(
        # "step-icon"
        component_html_class: :"step-icon",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:steps-vertical"
      # "@sm:steps-vertical"
      # "md:steps-vertical"
      # "@md:steps-vertical"
      # "lg:steps-vertical"
      # "@lg:steps-vertical"
      vertical: "steps-vertical",
      # "sm:steps-horizontal"
      # "@sm:steps-horizontal"
      # "md:steps-horizontal"
      # "@md:steps-horizontal"
      # "lg:steps-horizontal"
      # "@lg:steps-horizontal"
      horizontal: "steps-horizontal"
    )
  end
end
