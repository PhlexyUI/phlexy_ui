# frozen_string_literal: true

module PhlexyUI
  # @component html class="diff"
  class Diff < Base
    def initialize(*, as: :figure, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "diff"
        component_html_class: :diff,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def item_1(**options, &)
      generate_classes!(
        # "diff-item-1"
        component_html_class: :"diff-item-1",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def item_2(**options, &)
      generate_classes!(
        # "diff-item-2"
        component_html_class: :"diff-item-2",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def resizer(**options, &)
      generate_classes!(
        # "diff-resizer"
        component_html_class: :"diff-resizer",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end
  end
end
