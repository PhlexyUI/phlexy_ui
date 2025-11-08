# frozen_string_literal: true

module PhlexyUI
  # @component html class="mockup-window"
  class MockupWindow < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "mockup-window"
        component_html_class: :"mockup-window",
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end
  end
end
