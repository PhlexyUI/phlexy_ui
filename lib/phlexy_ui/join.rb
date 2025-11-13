# frozen_string_literal: true

module PhlexyUI
  class Join < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "join"
        component_html_class: :join,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def item(**options, &)
      generate_classes!(
        # "join-item"
        component_html_class: :"join-item",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:join-vertical"
      # "@sm:join-vertical"
      # "md:join-vertical"
      # "@md:join-vertical"
      # "lg:join-vertical"
      # "@lg:join-vertical"
      vertical: "join-vertical",
      # "sm:join-horizontal"
      # "@sm:join-horizontal"
      # "md:join-horizontal"
      # "@md:join-horizontal"
      # "lg:join-horizontal"
      # "@lg:join-horizontal"
      horizontal: "join-horizontal"
    )
  end
end
