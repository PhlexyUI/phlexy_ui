# frozen_string_literal: true

module PhlexyUI
  # @component html class="swap"
  class Swap < Base
    def initialize(*, as: :label, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "swap"
        component_html_class: :swap,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def on(**options, &)
      generate_classes!(
        # "swap-on"
        component_html_class: :"swap-on",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def off(**options, &)
      generate_classes!(
        # "swap-off"
        component_html_class: :"swap-off",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def indeterminate(**options, &)
      generate_classes!(
        # "swap-indeterminate"
        component_html_class: :"swap-indeterminate",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:swap-active"
      # "@sm:swap-active"
      # "md:swap-active"
      # "@md:swap-active"
      # "lg:swap-active"
      # "@lg:swap-active"
      active: "swap-active",
      # "sm:swap-rotate"
      # "@sm:swap-rotate"
      # "md:swap-rotate"
      # "@md:swap-rotate"
      # "lg:swap-rotate"
      # "@lg:swap-rotate"
      rotate: "swap-rotate",
      # "sm:swap-flip"
      # "@sm:swap-flip"
      # "md:swap-flip"
      # "@md:swap-flip"
      # "lg:swap-flip"
      # "@lg:swap-flip"
      flip: "swap-flip"
    )
  end
end
