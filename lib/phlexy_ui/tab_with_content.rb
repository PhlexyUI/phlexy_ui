# frozen_string_literal: true

module PhlexyUI
  # @private
  class TabWithContent < Base
    def initialize(*base_modifiers, content:, id: nil, **)
      super(*base_modifiers, **)
      @title = title
      @id = id
      @content = content
    end

    def view_template(&)
      title, *base_modifiers = @base_modifiers

      attributes = generate_attributes(
        base_modifiers,
        options,
        ATTRIBUTES_MAP
      )

      generate_classes!(
        component_html_class: :tab,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        input(
          type: :radio,
          name: id,
          class: classes,
          role: :tab,
          aria_label: title,
          **attributes,
          **options.except(*ATTRIBUTES_MAP.keys)
        )
      end

      @content&.call
    end

    private

    attr_reader :title

    ATTRIBUTES_MAP = {
      open: {checked: true},
      closed: true
    }.freeze

    register_modifiers(
      # "sm:tab-active"
      # "@sm:tab-active"
      # "md:tab-active"
      # "@md:tab-active"
      # "lg:tab-active"
      # "@lg:tab-active"
      active: "tab-active",
      # "sm:tab-disabled"
      # "@sm:tab-disabled"
      # "md:tab-disabled"
      # "@md:tab-disabled"
      # "lg:tab-disabled"
      # "@lg:tab-disabled"
      disabled: "tab-disabled"
    )
  end
end
