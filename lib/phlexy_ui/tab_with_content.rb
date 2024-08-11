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

      @attributes_modifiers = base_modifiers.select do |modifier|
        ATTRIBUTES_MAP.key?(modifier)
      end

      base_modifiers = base_modifiers.reject do |modifier|
        ATTRIBUTES_MAP.key?(modifier)
      end

      attributes = ATTRIBUTES_MAP.select do |key|
        @attributes_modifiers.include?(key)
      end

      generate_classes!(
        component_html_class: :tab,
        modifiers_map: Tab::TAB_MODIFIERS_CLASSES,
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
          **options
        )
      end

      @content&.call
    end

    private

    attr_reader :title

    ATTRIBUTES_MAP = {
      checked: true
    }.freeze
  end
end
