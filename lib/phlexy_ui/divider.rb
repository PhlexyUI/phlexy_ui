# frozen_string_literal: true

module PhlexyUI
  class Divider < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "divider"
        component_html_class: :divider,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:divider-vertical"
      # "@sm:divider-vertical"
      # "md:divider-vertical"
      # "@md:divider-vertical"
      # "lg:divider-vertical"
      # "@lg:divider-vertical"
      vertical: "divider-vertical",
      # "sm:divider-horizontal"
      # "@sm:divider-horizontal"
      # "md:divider-horizontal"
      # "@md:divider-horizontal"
      # "lg:divider-horizontal"
      # "@lg:divider-horizontal"
      horizontal: "divider-horizontal",
      # "sm:divider-start"
      # "@sm:divider-start"
      # "md:divider-start"
      # "@md:divider-start"
      # "lg:divider-start"
      # "@lg:divider-start"
      start: "divider-start",
        # "sm:divider-end"
        # "@sm:divider-end"
        # "md:divider-end"
        # "@md:divider-end"
        # "lg:divider-end"
        # "@lg:divider-end"
      end: "divider-end",
      # "sm:divider-neutral"
      # "@sm:divider-neutral"
      # "md:divider-neutral"
      # "@md:divider-neutral"
      # "lg:divider-neutral"
      # "@lg:divider-neutral"
      neutral: "divider-neutral",
      # "sm:divider-primary"
      # "@sm:divider-primary"
      # "md:divider-primary"
      # "@md:divider-primary"
      # "lg:divider-primary"
      # "@lg:divider-primary"
      primary: "divider-primary",
      # "sm:divider-secondary"
      # "@sm:divider-secondary"
      # "md:divider-secondary"
      # "@md:divider-secondary"
      # "lg:divider-secondary"
      # "@lg:divider-secondary"
      secondary: "divider-secondary",
      # "sm:divider-accent"
      # "@sm:divider-accent"
      # "md:divider-accent"
      # "@md:divider-accent"
      # "lg:divider-accent"
      # "@lg:divider-accent"
      accent: "divider-accent",
      # "sm:divider-success"
      # "@sm:divider-success"
      # "md:divider-success"
      # "@md:divider-success"
      # "lg:divider-success"
      # "@lg:divider-success"
      success: "divider-success",
      # "sm:divider-warning"
      # "@sm:divider-warning"
      # "md:divider-warning"
      # "@md:divider-warning"
      # "lg:divider-warning"
      # "@lg:divider-warning"
      warning: "divider-warning",
      # "sm:divider-info"
      # "@sm:divider-info"
      # "md:divider-info"
      # "@md:divider-info"
      # "lg:divider-info"
      # "@lg:divider-info"
      info: "divider-info",
      # "sm:divider-error"
      # "@sm:divider-error"
      # "md:divider-error"
      # "@md:divider-error"
      # "lg:divider-error"
      # "@lg:divider-error"
      error: "divider-error"
    )
  end
end
