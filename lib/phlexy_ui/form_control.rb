# frozen_string_literal: true

module PhlexyUI
  class FormControl < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: "form-control",
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end
  end
end
