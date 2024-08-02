# frozen_string_literal: true

module PhlexyUI
  class Card < Base
    def initialize(*, as: :section, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :card,
        modifiers_map: CARD_MODIFIERS_MAP,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def body(**options, &)
      generate_classes!(
        component_html_class: :"card-body",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def title(**options, &)
      generate_classes!(
        component_html_class: :"card-title",
        options:
      ).then do |classes|
        header(class: classes, **options, &)
      end
    end

    def actions(**options, &)
      generate_classes!(
        component_html_class: :"card-actions",
        options:
      ).then do |classes|
        footer(class: classes, **options, &)
      end
    end

    private

    CARD_MODIFIERS_MAP = {
      image_full: "image-full",
      bordered: "card-bordered",
      normal: "card-normal",
      compact: "card-compact",
      side: "card-side",
      glass: "glass"
    }.freeze
  end
end
