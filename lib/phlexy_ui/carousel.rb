# frozen_string_literal: true

module PhlexyUI
  # @component html class="carousel"
  class Carousel < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "carousel"
        component_html_class: :carousel,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def item(**options, &)
      generate_classes!(
        # "carousel-item"
        component_html_class: :"carousel-item",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:carousel-start"
      # "@sm:carousel-start"
      # "md:carousel-start"
      # "@md:carousel-start"
      # "lg:carousel-start"
      # "@lg:carousel-start"
      start: "carousel-start",
      # "sm:carousel-center"
      # "@sm:carousel-center"
      # "md:carousel-center"
      # "@md:carousel-center"
      # "lg:carousel-center"
      # "@lg:carousel-center"
      center: "carousel-center",
        # "sm:carousel-end"
        # "@sm:carousel-end"
        # "md:carousel-end"
        # "@md:carousel-end"
        # "lg:carousel-end"
        # "@lg:carousel-end"
      end: "carousel-end",
      # "sm:carousel-vertical"
      # "@sm:carousel-vertical"
      # "md:carousel-vertical"
      # "@md:carousel-vertical"
      # "lg:carousel-vertical"
      # "@lg:carousel-vertical"
      vertical: "carousel-vertical",
      # "sm:carousel-horizontal"
      # "@sm:carousel-horizontal"
      # "md:carousel-horizontal"
      # "@md:carousel-horizontal"
      # "lg:carousel-horizontal"
      # "@lg:carousel-horizontal"
      horizontal: "carousel-horizontal"
    )
  end
end
