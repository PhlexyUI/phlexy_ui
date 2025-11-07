# frozen_string_literal: true

module PhlexyUI
  # @component html class="hover-gallery"
  class HoverGallery < Base
    def initialize(*, as: :figure, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "hover-gallery"
        component_html_class: :"hover-gallery",
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end
  end
end
