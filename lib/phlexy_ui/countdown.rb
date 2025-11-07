# frozen_string_literal: true

module PhlexyUI
  # @component html class="countdown"
  class Countdown < Base
    def initialize(*, as: :span, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "countdown"
        component_html_class: :countdown,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end
  end
end
