# frozen_string_literal: true

module PhlexyUI
  class AvatarGroup < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "avatar-group"
        component_html_class: :"avatar-group",
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def avatar(*, **, &)
      render PhlexyUI::Avatar.new(*, **, &)
    end
  end
end
