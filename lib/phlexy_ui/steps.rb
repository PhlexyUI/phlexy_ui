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

    def step(**options, &)
      generate_classes!(
        # "step"
        component_html_class: :step,
        options:
      ).then do |classes|
        li(class: classes, **options, &)
      end
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
