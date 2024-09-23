# frozen_string_literal: true

module PhlexyUI
  class Avatar < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :avatar,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    private

    register_modifiers(
      # "sm:online"
      # "md:online"
      # "lg:online"
      online: "online",
      # "sm:offline"
      # "md:offline"
      # "lg:offline"
      offline: "offline",
      # "sm:placeholder"
      # "md:placeholder"
      # "lg:placeholder"
      placeholder: "placeholder"
    )
  end
end
