# frozen_string_literal: true

module PhlexyUI
  class Checkbox < Base
    def view_template(&)
      attributes = generate_attributes(base_modifiers, options, ATTRIBUTES_MAP)

      generate_classes!(
        component_html_class: :checkbox,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        input(
          type: :checkbox,
          class: classes,
          **options.except(*ATTRIBUTES_MAP.keys),
          **attributes,
          &
        )
      end
    end

    private

    ATTRIBUTES_MAP = {
      checked: true,
      disabled: true
    }.freeze

    register_modifiers(
      # "sm:checkbox-primary"
      # "md:checkbox-primary"
      # "lg:checkbox-primary"
      primary: "checkbox-primary",
      # "sm:checkbox-secondary"
      # "md:checkbox-secondary"
      # "lg:checkbox-secondary"
      secondary: "checkbox-secondary",
      # "sm:checkbox-accent"
      # "md:checkbox-accent"
      # "lg:checkbox-accent"
      accent: "checkbox-accent",
      # "sm:checkbox-success"
      # "md:checkbox-success"
      # "lg:checkbox-success"
      success: "checkbox-success",
      # "sm:checkbox-warning"
      # "md:checkbox-warning"
      # "lg:checkbox-warning"
      warning: "checkbox-warning",
      # "sm:checkbox-info"
      # "md:checkbox-info"
      # "lg:checkbox-info"
      info: "checkbox-info",
      # "sm:checkbox-error"
      # "md:checkbox-error"
      # "lg:checkbox-error"
      error: "checkbox-error",
      # "sm:checkbox-lg"
      # "md:checkbox-lg"
      # "lg:checkbox-lg"
      lg: "checkbox-lg",
      # "sm:checkbox-md"
      # "md:checkbox-md"
      # "lg:checkbox-md"
      md: "checkbox-md",
      # "sm:checkbox-sm"
      # "md:checkbox-sm"
      # "lg:checkbox-sm"
      sm: "checkbox-sm",
      # "sm:checkbox-xs"
      # "md:checkbox-xs"
      # "lg:checkbox-xs"
      xs: "checkbox-xs"
    )
  end
end
