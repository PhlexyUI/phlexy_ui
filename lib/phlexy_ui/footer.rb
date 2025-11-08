# frozen_string_literal: true

module PhlexyUI
  # @component html class="footer"
  class Footer < Base
    def initialize(*, as: :footer, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "footer"
        component_html_class: :footer,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def title(**options, &)
      generate_classes!(
        # "footer-title"
        component_html_class: :"footer-title",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:footer-center"
      # "@sm:footer-center"
      # "md:footer-center"
      # "@md:footer-center"
      # "lg:footer-center"
      # "@lg:footer-center"
      center: "footer-center",
      # "sm:footer-horizontal"
      # "@sm:footer-horizontal"
      # "md:footer-horizontal"
      # "@md:footer-horizontal"
      # "lg:footer-horizontal"
      # "@lg:footer-horizontal"
      horizontal: "footer-horizontal",
      # "sm:footer-vertical"
      # "@sm:footer-vertical"
      # "md:footer-vertical"
      # "@md:footer-vertical"
      # "lg:footer-vertical"
      # "@lg:footer-vertical"
      vertical: "footer-vertical"
    )
  end
end
