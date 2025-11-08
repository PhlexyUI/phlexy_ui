# frozen_string_literal: true

module PhlexyUI
  # @component html class="mockup-code"
  class MockupCode < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "mockup-code"
        component_html_class: :"mockup-code",
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end
  end
end
