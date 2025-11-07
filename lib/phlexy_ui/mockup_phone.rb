# frozen_string_literal: true

module PhlexyUI
  # @component html class="mockup-phone"
  class MockupPhone < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "mockup-phone"
        component_html_class: :"mockup-phone",
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def camera(**options, &)
      generate_classes!(
        # "mockup-phone-camera"
        component_html_class: :"mockup-phone-camera",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def display(**options, &)
      generate_classes!(
        # "mockup-phone-display"
        component_html_class: :"mockup-phone-display",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end
  end
end
