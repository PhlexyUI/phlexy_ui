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
      # "sm:tabs-boxed"
      # "md:tabs-boxed"
      # "lg:tabs-boxed"
      boxed: "tabs-boxed",
      # "sm:tabs-bordered"
      # "md:tabs-bordered"
      # "lg:tabs-bordered"
      bordered: "tabs-bordered",
      # "sm:tabs-lifted"
      # "md:tabs-lifted"
      # "lg:tabs-lifted"
      lifted: "tabs-lifted",
      # "sm:tabs-xs"
      # "md:tabs-xs"
      # "lg:tabs-xs"
      xs: "tabs-xs",
      # "sm:tabs-sm"
      # "md:tabs-sm"
      # "lg:tabs-sm"
      sm: "tabs-sm",
      # "sm:tabs-md"
      # "md:tabs-md"
      # "lg:tabs-md"
      md: "tabs-md",
      # "sm:tabs-lg"
      # "md:tabs-lg"
      # "lg:tabs-lg"
      lg: "tabs-lg"
    }.freeze

    TAB_MODIFIERS_CLASSES = {
      # "sm:tab-active"
      # "md:tab-active"
      # "lg:tab-active"
      active: "tab-active",
      # "sm:tab-disabled"
      # "md:tab-disabled"
      # "lg:tab-disabled"
      disabled: "tab-disabled"
    }.freeze
  end
end
