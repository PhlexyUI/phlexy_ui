# frozen_string_literal: true

module PhlexyUI
  # @component html class="collapse"
  class Accordion < Base
    def initialize(*, name:, checked: false, as: :div, **)
      super(*, **)
      @name = name
      @checked = checked
      @as = as
    end

    def view_template(&block)
      generate_classes!(
        component_html_class: :collapse,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options) do
          input(type: :radio, name:, checked:)
          div(class: "collapse-title", &title_block) if title_block
          div(class: "collapse-content", &block) if block
        end
      end
    end

    def title(&block)
      @title_block = block
    end

    private

    attr_reader :name, :checked, :title_block

    register_modifiers(
      # "sm:collapse-arrow"
      # "md:collapse-arrow"
      # "lg:collapse-arrow"
      arrow: "collapse-arrow",
      # "sm:collapse-plus"
      # "md:collapse-plus"
      # "lg:collapse-plus"
      plus: "collapse-plus",
      # "sm:collapse-open"
      # "md:collapse-open"
      # "lg:collapse-open"
      open: "collapse-open",
      # "sm:collapse-close"
      # "md:collapse-close"
      # "lg:collapse-close"
      close: "collapse-close"
    )
  end
end
