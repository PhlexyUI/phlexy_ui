# frozen_string_literal: true

module PhlexyUI
  class Skeleton < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "skeleton"
        component_html_class: :skeleton,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    private

    register_modifiers({})
  end
end
