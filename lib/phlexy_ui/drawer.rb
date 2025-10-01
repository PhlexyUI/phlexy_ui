# frozen_string_literal: true

module PhlexyUI
  class Drawer < Base
    def initialize(*, id:, as: :section, **)
      super(*, **)
      @as = as
      @id = id
    end

    def view_template(&)
      generate_classes!(
        # "drawer"
        component_html_class: :drawer,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def toggle(**options, &)
      generate_classes!(
        # "drawer-toggle"
        component_html_class: :"drawer-toggle",
        options:
      ).then do |classes|
        input(id:, type: :checkbox, class: classes, **options, &)
      end
    end

    def content(as: :div, **options, &)
      generate_classes!(
        # "drawer-content"
        component_html_class: :"drawer-content",
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def side(as: :div, **options, &)
      generate_classes!(
        # "drawer-side"
        component_html_class: :"drawer-side",
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def overlay(**options, &)
      generate_classes!(
        # "drawer-overlay"
        component_html_class: :"drawer-overlay",
        options:
      ).then do |classes|
        label(for: id, class: classes, **options, &)
      end
    end

    def button(*, **, &)
      render Button.new(*, as: :label, for: id, **, &)
    end

    private

    register_modifiers(
        # "sm:drawer-end"
        # "@sm:drawer-end"
        # "md:drawer-end"
        # "@md:drawer-end"
        # "lg:drawer-end"
        # "@lg:drawer-end"
        # "xl:drawer-end"
        # "@xl:drawer-end"
      end: "drawer-end",
      # "sm:drawer-open"
      # "@sm:drawer-open"
      # "md:drawer-open"
      # "@md:drawer-open"
      # "lg:drawer-open"
      # "@lg:drawer-open"
      # "xl:drawer-open"
      # "@xl:drawer-open"
      open: "drawer-open"
    )
  end
end
