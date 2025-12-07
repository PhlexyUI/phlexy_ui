# frozen_string_literal: true

module PhlexyUI
  # @component html class="kbd"
  class Kbd < Base
    def initialize(*, as: :kbd, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "kbd"
        component_html_class: :kbd,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:kbd-xs"
      # "@sm:kbd-xs"
      # "md:kbd-xs"
      # "@md:kbd-xs"
      # "lg:kbd-xs"
      # "@lg:kbd-xs"
      xs: "kbd-xs",
      # "sm:kbd-sm"
      # "@sm:kbd-sm"
      # "md:kbd-sm"
      # "@md:kbd-sm"
      # "lg:kbd-sm"
      # "@lg:kbd-sm"
      sm: "kbd-sm",
      # "sm:kbd-md"
      # "@sm:kbd-md"
      # "md:kbd-md"
      # "@md:kbd-md"
      # "lg:kbd-md"
      # "@lg:kbd-md"
      md: "kbd-md",
      # "sm:kbd-lg"
      # "@sm:kbd-lg"
      # "md:kbd-lg"
      # "@md:kbd-lg"
      # "lg:kbd-lg"
      # "@lg:kbd-lg"
      lg: "kbd-lg",
      # "sm:kbd-xl"
      # "@sm:kbd-xl"
      # "md:kbd-xl"
      # "@md:kbd-xl"
      # "lg:kbd-xl"
      # "@lg:kbd-xl"
      xl: "kbd-xl"
    )
  end
end
