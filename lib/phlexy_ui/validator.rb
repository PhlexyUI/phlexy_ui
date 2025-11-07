# frozen_string_literal: true

module PhlexyUI
  # @component html class="validator"
  class Validator < Base
    def initialize(*, as: :input, **)
      super(*, **)
      @as = as
    end

    def view_template(&block)
      generate_classes!(
        # "validator"
        component_html_class: :validator,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options)

        block&.call(self)
      end
    end

    def hint(**options, &block)
      generate_classes!(
        # "validator-hint"
        component_html_class: :"validator-hint",
        options:
      ).then do |classes|
        p(class: classes, **options, &block)
      end
    end
  end
end
