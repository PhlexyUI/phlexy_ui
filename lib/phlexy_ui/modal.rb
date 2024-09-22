# frozen_string_literal: true

module PhlexyUI
  class Modal < Base
    def initialize(*, id:, **)
      super(*, **)
      @id = id
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :modal,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        dialog(id:, class: classes, **options, &)
      end
    end

    def body(*, as: :div, **options, &)
      generate_classes!(
        component_html_class: :"modal-box",
        options:
      ).then do |classes|
        if base_modifiers.include?(:tap_outside_to_close)
          public_send(as, class: classes, **options, &)
          backdrop
        else
          public_send(as, class: classes, **options, &)
        end
      end
    end

    def action(*, as: :div, **options, &)
      generate_classes!(
        component_html_class: :"modal-action",
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def backdrop(*, **options, &)
      generate_classes!(
        component_html_class: :"modal-backdrop",
        options:
      ).then do |classes|
        form method: :dialog, class: classes, **options do
          button
        end
      end
    end

    def close_button(*, **, &)
      form method: :dialog do
        render PhlexyUI::Button.new(*, **, &)
      end
    end

    private

    register_modifiers(
      # "sm:modal-open"
      # "md:modal-open"
      # "lg:modal-open"
      open: "modal-open",
      # "sm:modal-top"
      # "md:modal-top"
      # "lg:modal-top"
      top: "modal-top",
      # "sm:modal-bottom"
      # "md:modal-bottom"
      # "lg:modal-bottom"
      bottom: "modal-bottom",
      # "sm:modal-middle"
      # "md:modal-middle"
      # "lg:modal-middle"
      middle: "modal-middle"
    )
  end
end
