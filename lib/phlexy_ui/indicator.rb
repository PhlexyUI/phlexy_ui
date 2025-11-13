# frozen_string_literal: true

module PhlexyUI
  class Indicator < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "indicator"
        component_html_class: :indicator,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def item(*base_modifiers, **, &)
      render IndicatorItem.new(*base_modifiers, **, &)
    end
  end
end
