# frozen_string_literal: true

module PhlexyUI
  # @component html class="theme-controller"
  # Theme controller changes the theme when checkbox/radio is checked
  # Supports common patterns: swap, toggle, dropdown, radio buttons
  class ThemeController < Base
    register_modifiers(
      # "sm:swap"
      # "md:swap"
      # "lg:swap"
      swap: "swap",
      # "sm:swap sm:swap-rotate"
      # "md:swap md:swap-rotate"
      # "lg:swap lg:swap-rotate"
      swap_rotate: "swap swap-rotate",
      # "sm:swap sm:swap-flip"
      # "md:swap md:swap-flip"
      # "lg:swap lg:swap-flip"
      swap_flip: "swap swap-flip",
      # "sm:toggle"
      # "md:toggle"
      # "lg:toggle"
      toggle: "toggle"
    )

    def initialize(*, theme_value: nil, checked: false, as: :input, **)
      super(*, **)
      @theme_value = theme_value
      @checked = checked
      @as = as
    end

    def view_template(&block)
      input_classes = generate_classes!(
        # "theme-controller"
        component_html_class: :"theme-controller",
        modifiers_map: {},
        base_modifiers: [],
        options: {}
      )

      attrs = {type: :checkbox, class: input_classes}
      attrs[:value] = theme_value if theme_value
      attrs[:checked] = true if checked
      attrs.merge!(options)

      if block
        # If block given, wrap in label with modifier classes (swap, toggle, etc.)
        wrapper_classes = generate_classes!(
          component_html_class: nil,
          modifiers_map: modifiers,
          base_modifiers:,
          options: {}
        )

        label(class: wrapper_classes) do
          public_send(as, **attrs)
          whitespace
          block.call
          whitespace
        end
      else
        # Just render the input
        public_send(as, **attrs)
      end
    end

    private

    attr_reader :theme_value, :checked
  end
end
