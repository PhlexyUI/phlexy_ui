# frozen_string_literal: true

module PhlexyUI
  # @component html class="collapse"
  class Collapse < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "collapse"
        component_html_class: :collapse,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def title(**options, &)
      generate_classes!(
        # "collapse-title"
        component_html_class: :"collapse-title",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def content(**options, &)
      generate_classes!(
        # "collapse-content"
        component_html_class: :"collapse-content",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:collapse-arrow"
      # "@sm:collapse-arrow"
      # "md:collapse-arrow"
      # "@md:collapse-arrow"
      # "lg:collapse-arrow"
      # "@lg:collapse-arrow"
      arrow: "collapse-arrow",
      # "sm:collapse-plus"
      # "@sm:collapse-plus"
      # "md:collapse-plus"
      # "@md:collapse-plus"
      # "lg:collapse-plus"
      # "@lg:collapse-plus"
      plus: "collapse-plus",
      # "sm:collapse-open"
      # "@sm:collapse-open"
      # "md:collapse-open"
      # "@md:collapse-open"
      # "lg:collapse-open"
      # "@lg:collapse-open"
      open: "collapse-open",
      # "sm:collapse-close"
      # "@sm:collapse-close"
      # "md:collapse-close"
      # "@md:collapse-close"
      # "lg:collapse-close"
      # "@lg:collapse-close"
      close: "collapse-close"
    )
  end
end
