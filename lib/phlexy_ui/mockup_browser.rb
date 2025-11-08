# frozen_string_literal: true

module PhlexyUI
  # @component html class="mockup-browser"
  class MockupBrowser < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "mockup-browser"
        component_html_class: :"mockup-browser",
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def toolbar(**options, &)
      generate_classes!(
        # "mockup-browser-toolbar"
        component_html_class: :"mockup-browser-toolbar",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end
  end
end
