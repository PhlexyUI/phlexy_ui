# frozen_string_literal: true

module PhlexyUI
  class Menu < Base
    def view_template(&)
      generate_classes!(
        component_html_class: :menu,
        modifiers_map: MENU_MODIFIERS_MAP,
        base_modifiers:,
        options:
      ).then do |classes|
        ul(class: classes, **options, &)
      end
    end

    def title(*, as: :li, **options, &)
      generate_classes!(
        component_html_class: :"menu-title",
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def item(*base_modifiers, **options, &)
      generate_classes!(
        modifiers_map: MENU_ITEM_MODIFIERS_MAP,
        base_modifiers:,
        options:
      ).then do |classes|
        li(class: classes, &)
      end
    end

    def submenu(*base_modifiers, **, &)
      if base_modifiers.include?(:collapsible)
        render CollapsibleSubMenu.new(*base_modifiers, **, &)
      else
        render SubMenu.new(*base_modifiers, **, &)
      end
    end

    private

    MENU_MODIFIERS_MAP = {
      xs: "menu-xs",
      sm: "menu-sm",
      md: "menu-md",
      lg: "menu-lg",
      vertical: "menu-vertical",
      horizontal: "menu-horizontal"
    }.freeze

    MENU_ITEM_MODIFIERS_MAP = {
      disabled: "disabled",
      active: "active",
      focus: "focus"
    }.freeze
  end
end
