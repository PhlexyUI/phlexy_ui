# frozen_string_literal: true

module PhlexyUI
  # @component html class="list"
  class List < Base
    def initialize(*, as: :ul, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "list"
        component_html_class: :list,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def row(**options, &)
      generate_classes!(
        # "list-row"
        component_html_class: :"list-row",
        options:
      ).then do |classes|
        li(class: classes, **options, &)
      end
    end

    def col_wrap(as: :div, **options, &)
      generate_classes!(
        # "list-col-wrap"
        component_html_class: :"list-col-wrap",
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def col_grow(as: :div, **options, &)
      generate_classes!(
        # "list-col-grow"
        component_html_class: :"list-col-grow",
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end
  end
end
