# frozen_string_literal: true

module PhlexyUI
  class Tooltip < Base
    def initialize(*, tip:, as: :div, **)
      super(*, **)
      @tip = tip
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :tooltip,
        modifiers_map: TOOLTIP_MODIFIERS_MAP,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, data_tip: tip, **options, &)
      end
    end

    private

    attr_reader :tip

    TOOLTIP_MODIFIERS_MAP = {
      # "sm:tooltip-open"
      # "md:tooltip-open"
      # "lg:tooltip-open"
      open: "tooltip-open",
      # "sm:tooltip-top"
      # "md:tooltip-top"
      # "lg:tooltip-top"
      top: "tooltip-top",
      # "sm:tooltip-bottom"
      # "md:tooltip-bottom"
      # "lg:tooltip-bottom"
      bottom: "tooltip-bottom",
      # "sm:tooltip-left"
      # "md:tooltip-left"
      # "lg:tooltip-left"
      left: "tooltip-left",
      # "sm:tooltip-right"
      # "md:tooltip-right"
      # "lg:tooltip-right"
      right: "tooltip-right",
      # "sm:tooltip-primary"
      # "md:tooltip-primary"
      # "lg:tooltip-primary"
      primary: "tooltip-primary",
      # "sm:tooltip-secondary"
      # "md:tooltip-secondary"
      # "lg:tooltip-secondary"
      secondary: "tooltip-secondary",
      # "sm:tooltip-accent"
      # "md:tooltip-accent"
      # "lg:tooltip-accent"
      accent: "tooltip-accent",
      # "sm:tooltip-info"
      # "md:tooltip-info"
      # "lg:tooltip-info"
      info: "tooltip-info",
      # "sm:tooltip-success"
      # "md:tooltip-success"
      # "lg:tooltip-success"
      success: "tooltip-success",
      # "sm:tooltip-warning"
      # "md:tooltip-warning"
      # "lg:tooltip-warning"
      warning: "tooltip-warning",
      # "sm:tooltip-error"
      # "md:tooltip-error"
      # "lg:tooltip-error"
      error: "tooltip-error"
    }.freeze
  end
end
