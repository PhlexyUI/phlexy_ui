# frozen_string_literal: true

module PhlexyUI
  # @component html class="fieldset"
  class Fieldset < Base
    def initialize(*, as: :fieldset, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "fieldset"
        component_html_class: :fieldset,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def legend(**options, &)
      generate_classes!(
        # "fieldset-legend"
        component_html_class: :"fieldset-legend",
        options:
      ).then do |classes|
        super(class: classes, **options, &)
      end
    end
  end
end
