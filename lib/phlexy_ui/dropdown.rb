# frozen_string_literal: true

module PhlexyUI
  class Dropdown < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :dropdown,
        modifiers_map: DROPDOWN_MODIFIERS_MAP,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def button(*, **, &)
      if as == :details
        render Button.new(*, tabindex: 0, as: :summary, **, &)
      else
        render Button.new(*, tabindex: 0, **, &)
      end
    end

    def content(as: :div, **options, &)
      generate_classes!(
        component_html_class: :"dropdown-content",
        options:
      ).then do |classes|
        public_send(as, tabindex: 0, class: classes, **options, &)
      end
    end

    private

    DROPDOWN_MODIFIERS_MAP = {
      end: "dropdown-end",
      top: "dropdown-top",
      bottom: "dropdown-bottom",
      left: "dropdown-left",
      right: "dropdown-right",
      hover: "dropdown-hover",
      open: "dropdown-open"
    }.freeze
  end
end
