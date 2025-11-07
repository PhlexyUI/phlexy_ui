# frozen_string_literal: true

module PhlexyUI
  # @component html class="list"
  class List < Base
    def initialize(*, as: :ul, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "list"
        component_html_class: :list,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def row(**options, &)
      generate_classes!(
        # "list-row"
        component_html_class: :"list-row",
        options:
      ).then do |classes|
        li(class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:list-col-wrap"
      # "@sm:list-col-wrap"
      # "md:list-col-wrap"
      # "@md:list-col-wrap"
      # "lg:list-col-wrap"
      # "@lg:list-col-wrap"
      col_wrap: "list-col-wrap",
      # "sm:list-col-grow"
      # "@sm:list-col-grow"
      # "md:list-col-grow"
      # "@md:list-col-grow"
      # "lg:list-col-grow"
      # "@lg:list-col-grow"
      col_grow: "list-col-grow"
    )
  end
end
