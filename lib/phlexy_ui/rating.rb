# frozen_string_literal: true

module PhlexyUI
  # @component html class="rating"
  class Rating < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "rating"
        component_html_class: :rating,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:rating-half"
      # "@sm:rating-half"
      # "md:rating-half"
      # "@md:rating-half"
      # "lg:rating-half"
      # "@lg:rating-half"
      half: "rating-half",
      # "sm:rating-hidden"
      # "@sm:rating-hidden"
      # "md:rating-hidden"
      # "@md:rating-hidden"
      # "lg:rating-hidden"
      # "@lg:rating-hidden"
      hidden: "rating-hidden",
      # "sm:rating-xs"
      # "@sm:rating-xs"
      # "md:rating-xs"
      # "@md:rating-xs"
      # "lg:rating-xs"
      # "@lg:rating-xs"
      xs: "rating-xs",
      # "sm:rating-sm"
      # "@sm:rating-sm"
      # "md:rating-sm"
      # "@md:rating-sm"
      # "lg:rating-sm"
      # "@lg:rating-sm"
      sm: "rating-sm",
      # "sm:rating-md"
      # "@sm:rating-md"
      # "md:rating-md"
      # "@md:rating-md"
      # "lg:rating-md"
      # "@lg:rating-md"
      md: "rating-md",
      # "sm:rating-lg"
      # "@sm:rating-lg"
      # "md:rating-lg"
      # "@md:rating-lg"
      # "lg:rating-lg"
      # "@lg:rating-lg"
      lg: "rating-lg",
      # "sm:rating-xl"
      # "@sm:rating-xl"
      # "md:rating-xl"
      # "@md:rating-xl"
      # "lg:rating-xl"
      # "@lg:rating-xl"
      xl: "rating-xl"
    )
  end
end
