# frozen_string_literal: true

module PhlexyUI
  class Avatar < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "avatar"
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
      # "@sm:online"
      # "md:online"
      # "@md:online"
      # "lg:online"
      # "@lg:online"
      online: "online",
      # "sm:offline"
      # "@sm:offline"
      # "md:offline"
      # "@md:offline"
      # "lg:offline"
      # "@lg:offline"
      offline: "offline",
      # "sm:placeholder"
      # "@sm:placeholder"
      # "md:placeholder"
      # "@md:placeholder"
      # "lg:placeholder"
      # "@lg:placeholder"
      placeholder: "placeholder"
    )
  end
end
