# frozen_string_literal: true

module PhlexyUI
  class Tabs < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :tabs,
        modifiers_map: TABS_MODIFIERS_CLASSES,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, role: :tablist, class: classes, **options, &)
      end
    end

    def tab(*base_modifiers, as: :div, **options, &)
      generate_classes!(
        component_html_class: :tab,
        modifiers_map: TAB_MODIFIERS_CLASSES,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, role: :tab, class: classes, **options, &)
      end
    end

    def content(as: :div, **options, &)
      generate_classes!(
        component_html_class: :"tab-content",
        options:
      ).then do |classes|
        public_send(as, role: :tabpanel, class: classes, **options, &)
      end
    end

    private

    TABS_MODIFIERS_CLASSES = {
      boxed: "tabs-boxed",
      bordered: "tabs-bordered",
      lifted: "tabs-lifted",
      xs: "tabs-xs",
      sm: "tabs-sm",
      md: "tabs-md",
      lg: "tabs-lg"
    }.freeze

    TAB_MODIFIERS_CLASSES = {
      active: "tab-active",
      disabled: "tab-disabled"
    }.freeze
  end
end
