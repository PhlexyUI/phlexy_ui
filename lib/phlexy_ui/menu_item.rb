# frozen_string_literal: true

module PhlexyUI
  # @private
  class MenuItem < Base
    def view_template(&)
      generate_classes!(
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        li(class: classes, **options, &)
      end
    end

    def title(*, **options, &block)
      generate_classes!(
        component_html_class: :"menu-title",
        options:
      ).then do |classes|
        h2(class: classes, **options, &block)
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

    register_modifiers(
      # "sm:disabled"
      # "@sm:disabled"
      # "md:disabled"
      # "@md:disabled"
      # "lg:disabled"
      # "@lg:disabled"
      disabled: "disabled",
      # "sm:active"
      # "@sm:active"
      # "md:active"
      # "@md:active"
      # "lg:active"
      # "@lg:active"
      active: "active",
      # "sm:focus"
      # "@sm:focus"
      # "md:focus"
      # "@md:focus"
      # "lg:focus"
      # "@lg:focus"
      focus: "focus"
    )
  end
end
