# frozen_string_literal: true

module PhlexyUI
  class Card < Base
    CONDITIONS_CLASSES = {
      # Modifiers
      image_full: "image-full",
      bordered: "card-bordered",
      normal: "card-normal",
      compact: "card-compact",
      side: "card-side",
      glass: "glass"
    }.freeze

    BASE_HTML_CLASS = "card"

    def initialize(*, as: :section, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      public_send(as, class: classes, data: data, &)
    end

    def body(**options, &)
      classes = ["card-body", options.delete(:class)]

      div(class: classes, **options, &)
    end

    def title(**options, &)
      classes = ["card-title", options.delete(:class)]

      header(class: classes, **options, &)
    end

    def actions(**options, &)
      classes = ["card-actions", options.delete(:class)]

      footer(class: classes, **options, &)
    end
  end
end
