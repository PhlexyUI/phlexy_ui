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
      # "md:link"
      # "lg:link"
      underlined: "link",
      # "sm:link-hover"
      # "md:link-hover"
      # "lg:link-hover"
      hover: "link-hover",
      # "sm:active"
      # "md:active"
      # "lg:active"
      active: "active",
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
      # "sm:link-primary"
      # "md:link-primary"
      # "lg:link-primary"
      primary: "link-primary",
      # "sm:link-secondary"
      # "md:link-secondary"
      # "lg:link-secondary"
      secondary: "link-secondary",
      # "sm:link-accent"
      # "md:link-accent"
      # "lg:link-accent"
      accent: "link-accent",
      # "sm:link-neutral"
      # "md:link-neutral"
      # "lg:link-neutral"
      neutral: "link-neutral",
      # "sm:link-info"
      # "md:link-info"
      # "lg:link-info"
      info: "link-info",
      # "sm:link-success"
      # "md:link-success"
      # "lg:link-success"
      success: "link-success",
      # "sm:link-warning"
      # "md:link-warning"
      # "lg:link-warning"
      warning: "link-warning",
      # "sm:link-error"
      # "md:link-error"
      # "lg:link-error"
      error: "link-error"
    ).freeze
  end
end
