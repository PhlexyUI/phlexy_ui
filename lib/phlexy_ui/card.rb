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
      # "sm:image-full"
      # "md:image-full"
      # "lg:image-full"
      image_full: "image-full",
      # "sm:card-bordered"
      # "md:card-bordered"
      # "lg:card-bordered"
      bordered: "card-bordered",
      # "sm:card-normal"
      # "md:card-normal"
      # "lg:card-normal"
      normal: "card-normal",
      # "sm:card-compact"
      # "md:card-compact"
      # "lg:card-compact"
      compact: "card-compact",
      # "sm:card-side"
      # "md:card-side"
      # "lg:card-side"
      side: "card-side",
      # "sm:glass"
      # "md:glass"
      # "lg:glass"
      glass: "glass"
    }.freeze
  end
end
