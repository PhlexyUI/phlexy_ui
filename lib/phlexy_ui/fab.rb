# frozen_string_literal: true

module PhlexyUI
  # @component html class="fab"
  class Fab < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "fab"
        component_html_class: :fab,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def close(**options, &)
      generate_classes!(
        # "fab-close"
        component_html_class: :"fab-close",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def main_action(**options, &)
      generate_classes!(
        # "fab-main-action"
        component_html_class: :"fab-main-action",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:fab-flower"
      # "@sm:fab-flower"
      # "md:fab-flower"
      # "@md:fab-flower"
      # "lg:fab-flower"
      # "@lg:fab-flower"
      flower: "fab-flower"
    )
  end
end
