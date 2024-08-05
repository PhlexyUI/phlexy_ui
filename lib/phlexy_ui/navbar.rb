# frozen_string_literal: true

module PhlexyUI
  class Navbar < Base
    def initialize(*, as: :nav, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :navbar,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def start(&)
      div(class: :"navbar-start", &)
    end

    def center(&)
      div(class: :"navbar-center", &)
    end

    def end(&)
      div(class: :"navbar-end", &)
    end
  end
end
