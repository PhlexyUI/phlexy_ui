# frozen_string_literal: true

module PhlexyUI
  class Mask < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "mask"
        component_html_class: :mask,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    private

    register_modifiers(
      # "sm:mask-squircle"
      # "@sm:mask-squircle"
      # "md:mask-squircle"
      # "@md:mask-squircle"
      # "lg:mask-squircle"
      # "@lg:mask-squircle"
      squircle: "mask-squircle",
      # "sm:mask-heart"
      # "@sm:mask-heart"
      # "md:mask-heart"
      # "@md:mask-heart"
      # "lg:mask-heart"
      # "@lg:mask-heart"
      heart: "mask-heart",
      # "sm:mask-hexagon"
      # "@sm:mask-hexagon"
      # "md:mask-hexagon"
      # "@md:mask-hexagon"
      # "lg:mask-hexagon"
      # "@lg:mask-hexagon"
      hexagon: "mask-hexagon",
      # "sm:mask-hexagon-2"
      # "@sm:mask-hexagon-2"
      # "md:mask-hexagon-2"
      # "@md:mask-hexagon-2"
      # "lg:mask-hexagon-2"
      # "@lg:mask-hexagon-2"
      hexagon_2: "mask-hexagon-2",
      # "sm:mask-decagon"
      # "@sm:mask-decagon"
      # "md:mask-decagon"
      # "@md:mask-decagon"
      # "lg:mask-decagon"
      # "@lg:mask-decagon"
      decagon: "mask-decagon",
      # "sm:mask-pentagon"
      # "@sm:mask-pentagon"
      # "md:mask-pentagon"
      # "@md:mask-pentagon"
      # "lg:mask-pentagon"
      # "@lg:mask-pentagon"
      pentagon: "mask-pentagon",
      # "sm:mask-diamond"
      # "@sm:mask-diamond"
      # "md:mask-diamond"
      # "@md:mask-diamond"
      # "lg:mask-diamond"
      # "@lg:mask-diamond"
      diamond: "mask-diamond",
      # "sm:mask-square"
      # "@sm:mask-square"
      # "md:mask-square"
      # "@md:mask-square"
      # "lg:mask-square"
      # "@lg:mask-square"
      square: "mask-square",
      # "sm:mask-circle"
      # "@sm:mask-circle"
      # "md:mask-circle"
      # "@md:mask-circle"
      # "lg:mask-circle"
      # "@lg:mask-circle"
      circle: "mask-circle",
      # "sm:mask-parallelogram"
      # "@sm:mask-parallelogram"
      # "md:mask-parallelogram"
      # "@md:mask-parallelogram"
      # "lg:mask-parallelogram"
      # "@lg:mask-parallelogram"
      parallelogram: "mask-parallelogram",
      # "sm:mask-parallelogram-2"
      # "@sm:mask-parallelogram-2"
      # "md:mask-parallelogram-2"
      # "@md:mask-parallelogram-2"
      # "lg:mask-parallelogram-2"
      # "@lg:mask-parallelogram-2"
      parallelogram_2: "mask-parallelogram-2",
      # "sm:mask-parallelogram-3"
      # "@sm:mask-parallelogram-3"
      # "md:mask-parallelogram-3"
      # "@md:mask-parallelogram-3"
      # "lg:mask-parallelogram-3"
      # "@lg:mask-parallelogram-3"
      parallelogram_3: "mask-parallelogram-3",
      # "sm:mask-parallelogram-4"
      # "@sm:mask-parallelogram-4"
      # "md:mask-parallelogram-4"
      # "@md:mask-parallelogram-4"
      # "lg:mask-parallelogram-4"
      # "@lg:mask-parallelogram-4"
      parallelogram_4: "mask-parallelogram-4",
      # "sm:mask-star"
      # "@sm:mask-star"
      # "md:mask-star"
      # "@md:mask-star"
      # "lg:mask-star"
      # "@lg:mask-star"
      star: "mask-star",
      # "sm:mask-star-2"
      # "@sm:mask-star-2"
      # "md:mask-star-2"
      # "@md:mask-star-2"
      # "lg:mask-star-2"
      # "@lg:mask-star-2"
      star_2: "mask-star-2",
      # "sm:mask-triangle"
      # "@sm:mask-triangle"
      # "md:mask-triangle"
      # "@md:mask-triangle"
      # "lg:mask-triangle"
      # "@lg:mask-triangle"
      triangle: "mask-triangle",
      # "sm:mask-triangle-2"
      # "@sm:mask-triangle-2"
      # "md:mask-triangle-2"
      # "@md:mask-triangle-2"
      # "lg:mask-triangle-2"
      # "@lg:mask-triangle-2"
      triangle_2: "mask-triangle-2",
      # "sm:mask-triangle-3"
      # "@sm:mask-triangle-3"
      # "md:mask-triangle-3"
      # "@md:mask-triangle-3"
      # "lg:mask-triangle-3"
      # "@lg:mask-triangle-3"
      triangle_3: "mask-triangle-3",
      # "sm:mask-triangle-4"
      # "@sm:mask-triangle-4"
      # "md:mask-triangle-4"
      # "@md:mask-triangle-4"
      # "lg:mask-triangle-4"
      # "@lg:mask-triangle-4"
      triangle_4: "mask-triangle-4",
      # "sm:mask-half-1"
      # "@sm:mask-half-1"
      # "md:mask-half-1"
      # "@md:mask-half-1"
      # "lg:mask-half-1"
      # "@lg:mask-half-1"
      half_1: "mask-half-1",
      # "sm:mask-half-2"
      # "@sm:mask-half-2"
      # "md:mask-half-2"
      # "@md:mask-half-2"
      # "lg:mask-half-2"
      # "@lg:mask-half-2"
      half_2: "mask-half-2"
    )
  end
end
