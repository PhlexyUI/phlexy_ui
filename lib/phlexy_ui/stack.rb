# frozen_string_literal: true

module PhlexyUI
  # @component html class="stack"
  class Stack < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "stack"
        component_html_class: :stack,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:stack-top"
      # "@sm:stack-top"
      # "md:stack-top"
      # "@md:stack-top"
      # "lg:stack-top"
      # "@lg:stack-top"
      top: "stack-top",
      # "sm:stack-bottom"
      # "@sm:stack-bottom"
      # "md:stack-bottom"
      # "@md:stack-bottom"
      # "lg:stack-bottom"
      # "@lg:stack-bottom"
      bottom: "stack-bottom",
      # "sm:stack-start"
      # "@sm:stack-start"
      # "md:stack-start"
      # "@md:stack-start"
      # "lg:stack-start"
      # "@lg:stack-start"
      start: "stack-start",
        # "sm:stack-end"
        # "@sm:stack-end"
        # "md:stack-end"
        # "@md:stack-end"
        # "lg:stack-end"
        # "@lg:stack-end"
      end: "stack-end"
    )
  end
end
