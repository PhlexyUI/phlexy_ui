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
        component_html_class: :drawer,
        modifiers_map: DRAWER_MODIFIERS_MAP,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def toggle(**options, &)
      generate_classes!(
        component_html_class: :"drawer-toggle",
        options:
      ).then do |classes|
        input(id:, type: :checkbox, class: classes, **options, &)
      end
    end

    def content(as: :div, **options, &)
      generate_classes!(
        component_html_class: :"drawer-content",
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def side(as: :div, **options, &)
      generate_classes!(
        component_html_class: :"drawer-side",
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def overlay(**options, &)
      generate_classes!(
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

    DRAWER_MODIFIERS_MAP = {
      end: "drawer-end",
      open: "drawer-open"
    }.freeze
  end
end