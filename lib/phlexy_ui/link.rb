# frozen_string_literal: true

module PhlexyUI
  class Link < Base
    def view_template(&)
      generate_classes!(
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        a(class: classes, **options, &)
      end
    end

    private

    attr_reader :link_to_name

    register_modifiers(
      # "sm:link"
      # "@sm:link"
      # "md:link"
      # "@md:link"
      # "lg:link"
      # "@lg:link"
      underlined: "link",
      # "sm:link-hover"
      # "@sm:link-hover"
      # "md:link-hover"
      # "@md:link-hover"
      # "lg:link-hover"
      # "@lg:link-hover"
      hover: "link-hover",
      # "sm:active"
      # "@sm:active"
      # "md:active"
      # "@md:active"
      # "lg:active"
      # "@lg:active"
      active: "active",
      # "sm:image-full"
      # "@sm:image-full"
      # "md:image-full"
      # "@md:image-full"
      # "lg:image-full"
      # "@lg:image-full"
      image_full: "image-full",
      # "sm:card-bordered"
      # "@sm:card-bordered"
      # "md:card-bordered"
      # "@md:card-bordered"
      # "lg:card-bordered"
      # "@lg:card-bordered"
      bordered: "card-bordered",
      # "sm:card-normal"
      # "@sm:card-normal"
      # "md:card-normal"
      # "@md:card-normal"
      # "lg:card-normal"
      # "@lg:card-normal"
      normal: "card-normal",
      # "sm:card-compact"
      # "@sm:card-compact"
      # "md:card-compact"
      # "@md:card-compact"
      # "lg:card-compact"
      # "@lg:card-compact"
      compact: "card-compact",
      # "sm:card-side"
      # "@sm:card-side"
      # "md:card-side"
      # "@md:card-side"
      # "lg:card-side"
      # "@lg:card-side"
      side: "card-side",
      # "sm:glass"
      # "@sm:glass"
      # "md:glass"
      # "@md:glass"
      # "lg:glass"
      # "@lg:glass"
      glass: "glass",
      # "sm:link-primary"
      # "@sm:link-primary"
      # "md:link-primary"
      # "@md:link-primary"
      # "lg:link-primary"
      # "@lg:link-primary"
      primary: "link-primary",
      # "sm:link-secondary"
      # "@sm:link-secondary"
      # "md:link-secondary"
      # "@md:link-secondary"
      # "lg:link-secondary"
      # "@lg:link-secondary"
      secondary: "link-secondary",
      # "sm:link-accent"
      # "@sm:link-accent"
      # "md:link-accent"
      # "@md:link-accent"
      # "lg:link-accent"
      # "@lg:link-accent"
      accent: "link-accent",
      # "sm:link-neutral"
      # "@sm:link-neutral"
      # "md:link-neutral"
      # "@md:link-neutral"
      # "lg:link-neutral"
      # "@lg:link-neutral"
      neutral: "link-neutral",
      # "sm:link-info"
      # "@sm:link-info"
      # "md:link-info"
      # "@md:link-info"
      # "lg:link-info"
      # "@lg:link-info"
      info: "link-info",
      # "sm:link-success"
      # "@sm:link-success"
      # "md:link-success"
      # "@md:link-success"
      # "lg:link-success"
      # "@lg:link-success"
      success: "link-success",
      # "sm:link-warning"
      # "@sm:link-warning"
      # "md:link-warning"
      # "@md:link-warning"
      # "lg:link-warning"
      # "@lg:link-warning"
      warning: "link-warning",
      # "sm:link-error"
      # "@sm:link-error"
      # "md:link-error"
      # "@md:link-error"
      # "lg:link-error"
      # "@lg:link-error"
      error: "link-error"
    ).freeze
  end
end
