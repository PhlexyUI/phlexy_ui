# frozen_string_literal: true

module PhlexyUI
  # @component html class="dock"
  class Dock < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "dock"
        component_html_class: :dock,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def label(**options, &)
      generate_classes!(
        # "dock-label"
        component_html_class: :"dock-label",
        options:
      ).then do |classes|
        span(class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:dock-active"
      # "@sm:dock-active"
      # "md:dock-active"
      # "@md:dock-active"
      # "lg:dock-active"
      # "@lg:dock-active"
      active: "dock-active",
      # "sm:dock-xs"
      # "@sm:dock-xs"
      # "md:dock-xs"
      # "@md:dock-xs"
      # "lg:dock-xs"
      # "@lg:dock-xs"
      xs: "dock-xs",
      # "sm:dock-sm"
      # "@sm:dock-sm"
      # "md:dock-sm"
      # "@md:dock-sm"
      # "lg:dock-sm"
      # "@lg:dock-sm"
      sm: "dock-sm",
      # "sm:dock-md"
      # "@sm:dock-md"
      # "md:dock-md"
      # "@md:dock-md"
      # "lg:dock-md"
      # "@lg:dock-md"
      md: "dock-md",
      # "sm:dock-lg"
      # "@sm:dock-lg"
      # "md:dock-lg"
      # "@md:dock-lg"
      # "lg:dock-lg"
      # "@lg:dock-lg"
      lg: "dock-lg",
      # "sm:dock-xl"
      # "@sm:dock-xl"
      # "md:dock-xl"
      # "@md:dock-xl"
      # "lg:dock-xl"
      # "@lg:dock-xl"
      xl: "dock-xl"
    )
  end
end
