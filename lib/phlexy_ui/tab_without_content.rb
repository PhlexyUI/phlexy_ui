# frozen_string_literal: true

module PhlexyUI
  # @private
  class TabWithoutContent < Base
    def view_template(&)
      generate_classes!(
        component_html_class: :tab,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        div role: :tab, class: classes, &
      end
    end

    private

    attr_reader :title

    register_modifiers(
      # "sm:tab-active"
      # "md:tab-active"
      # "lg:tab-active"
      active: "tab-active",
      # "sm:tab-disabled"
      # "md:tab-disabled"
      # "lg:tab-disabled"
      disabled: "tab-disabled"
    )
  end
end
