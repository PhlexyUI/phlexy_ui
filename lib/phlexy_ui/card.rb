# frozen_string_literal: true

module PhlexyUI
  class Card < Base
    def initialize(*, as: :section, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :card,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def body(**options, &)
      generate_classes!(
        component_html_class: :"card-body",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def title(**options, &)
      generate_classes!(
        component_html_class: :"card-title",
        options:
      ).then do |classes|
        header(class: classes, **options, &)
      end
    end

    def actions(**options, &)
      generate_classes!(
        component_html_class: :"card-actions",
        options:
      ).then do |classes|
        footer(class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:image-full"
      # "md:image-full"
      # "lg:image-full"
      image_full: "image-full",
      # "sm:card-bordered"
      # "md:card-bordered"
      # "lg:card-bordered"
      bordered: "card-bordered",
      # "sm:card-normal"
      # "md:card-normal"
      # "lg:card-normal"
      normal: "card-normal",
      # "sm:card-compact"
      # "md:card-compact"
      # "lg:card-compact"
      compact: "card-compact",
      # "sm:card-side"
      # "md:card-side"
      # "lg:card-side"
      side: "card-side",
      # "sm:glass"
      # "md:glass"
      # "lg:glass"
      glass: "glass",
      # "sm:bg-primary sm:text-primary-content"
      # "md:bg-primary md:text-primary-content"
      # "lg:bg-primary lg:text-primary-content"
      primary: "bg-primary text-primary-content",
      # "sm:bg-secondary sm:text-secondary-content"
      # "md:bg-secondary md:text-secondary-content"
      # "lg:bg-secondary lg:text-secondary-content"
      secondary: "bg-secondary text-secondary-content",
      # "sm:bg-accent sm:text-accent-content"
      # "md:bg-accent md:text-accent-content"
      # "lg:bg-accent lg:text-accent-content"
      accent: "bg-accent text-accent-content",
      # "sm:bg-neutral sm:text-neutral-content"
      # "md:bg-neutral md:text-neutral-content"
      # "lg:bg-neutral lg:text-neutral-content"
      neutral: "bg-neutral text-neutral-content",
      # "sm:bg-base-100 sm:text-base-content"
      # "md:bg-base-100 md:text-base-content"
      # "lg:bg-base-100 lg:text-base-content"
      base_100: "bg-base-100 text-base-content",
      # "sm:bg-base-200 sm:text-base-content"
      # "md:bg-base-200 md:text-base-content"
      # "lg:bg-base-200 lg:text-base-content"
      base_200: "bg-base-200 text-base-content",
      # "sm:bg-base-300 sm:text-base-content"
      # "md:bg-base-300 md:text-base-content"
      # "lg:bg-base-300 lg:text-base-content"
      base_300: "bg-base-300 text-base-content",
      # "sm:bg-info sm:text-info-content"
      # "md:bg-info sm:text-info-content"
      # "lg:bg-info sm:text-info-content"
      info: "bg-info text-info-content",
      # "sm:bg-success sm:text-success-content"
      # "md:bg-success md:text-success-content"
      # "lg:bg-success lg:text-success-content"
      success: "bg-success text-success-content",
      # "sm:bg-warning sm:text-warning-content"
      # "md:bg-warning md:text-warning-content"
      # "lg:bg-warning lg:text-warning-content"
      warning: "bg-warning text-warning-content",
      # "sm:bg-error sm:text-error-content"
      # "md:bg-error md:text-error-content"
      # "lg:bg-error lg:text-error-content"
      error: "bg-error text-error-content"
    )
  end
end
