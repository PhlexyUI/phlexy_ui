# frozen_string_literal: true

module PhlexyUI
  # @component html class="theme-controller"
  class ThemeController < Base
    def initialize(*, as: :input, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "theme-controller"
        component_html_class: :"theme-controller",
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, type: :checkbox, class: classes, **options, &)
      end
    end
  end
end
