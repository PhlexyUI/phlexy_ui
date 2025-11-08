# frozen_string_literal: true

module PhlexyUI
  # @component html class="filter"
  class Filter < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "filter"
        component_html_class: :filter,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def reset(**options, &)
      generate_classes!(
        # "filter-reset"
        component_html_class: :"filter-reset",
        options:
      ).then do |classes|
        input(type: :radio, class: classes, **options, &)
      end
    end
  end
end
