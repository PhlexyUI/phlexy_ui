# frozen_string_literal: true

module PhlexyUI
  # @component html class="indicator"
  class Indicator < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "indicator"
        component_html_class: :indicator,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def item(**options, &)
      generate_classes!(
        # "indicator-item"
        component_html_class: :"indicator-item",
        options:
      ).then do |classes|
        span(class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:indicator-start"
      # "@sm:indicator-start"
      # "md:indicator-start"
      # "@md:indicator-start"
      # "lg:indicator-start"
      # "@lg:indicator-start"
      start: "indicator-start",
      # "sm:indicator-center"
      # "@sm:indicator-center"
      # "md:indicator-center"
      # "@md:indicator-center"
      # "lg:indicator-center"
      # "@lg:indicator-center"
      center: "indicator-center",
        # "sm:indicator-end"
        # "@sm:indicator-end"
        # "md:indicator-end"
        # "@md:indicator-end"
        # "lg:indicator-end"
        # "@lg:indicator-end"
      end: "indicator-end",
      # "sm:indicator-top"
      # "@sm:indicator-top"
      # "md:indicator-top"
      # "@md:indicator-top"
      # "lg:indicator-top"
      # "@lg:indicator-top"
      top: "indicator-top",
      # "sm:indicator-middle"
      # "@sm:indicator-middle"
      # "md:indicator-middle"
      # "@md:indicator-middle"
      # "lg:indicator-middle"
      # "@lg:indicator-middle"
      middle: "indicator-middle",
      # "sm:indicator-bottom"
      # "@sm:indicator-bottom"
      # "md:indicator-bottom"
      # "@md:indicator-bottom"
      # "lg:indicator-bottom"
      # "@lg:indicator-bottom"
      bottom: "indicator-bottom"
    )
  end
end
