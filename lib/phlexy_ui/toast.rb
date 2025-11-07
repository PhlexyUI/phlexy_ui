# frozen_string_literal: true

module PhlexyUI
  # @component html class="toast"
  class Toast < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "toast"
        component_html_class: :toast,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:toast-start"
      # "@sm:toast-start"
      # "md:toast-start"
      # "@md:toast-start"
      # "lg:toast-start"
      # "@lg:toast-start"
      start: "toast-start",
      # "sm:toast-center"
      # "@sm:toast-center"
      # "md:toast-center"
      # "@md:toast-center"
      # "lg:toast-center"
      # "@lg:toast-center"
      center: "toast-center",
        # "sm:toast-end"
        # "@sm:toast-end"
        # "md:toast-end"
        # "@md:toast-end"
        # "lg:toast-end"
        # "@lg:toast-end"
      end: "toast-end",
      # "sm:toast-top"
      # "@sm:toast-top"
      # "md:toast-top"
      # "@md:toast-top"
      # "lg:toast-top"
      # "@lg:toast-top"
      top: "toast-top",
      # "sm:toast-middle"
      # "@sm:toast-middle"
      # "md:toast-middle"
      # "@md:toast-middle"
      # "lg:toast-middle"
      # "@lg:toast-middle"
      middle: "toast-middle",
      # "sm:toast-bottom"
      # "@sm:toast-bottom"
      # "md:toast-bottom"
      # "@md:toast-bottom"
      # "lg:toast-bottom"
      # "@lg:toast-bottom"
      bottom: "toast-bottom"
    )
  end
end
