# frozen_string_literal: true

module PhlexyUI
  class Label < Base
    def view_template(&)
      generate_classes!(
        # "label"
        component_html_class: :label,
        options:
      ).then do |classes|
        label(class: classes, **options, &)
      end
    end

    def text(as: :span, **options, &)
      generate_classes!(
        # "label-text"
        component_html_class: :"label-text",
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end
  end
end
