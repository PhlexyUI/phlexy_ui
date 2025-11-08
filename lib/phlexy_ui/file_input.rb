# frozen_string_literal: true

module PhlexyUI
  # @component html class="file-input"
  class FileInput < Base
    def initialize(*, as: :input, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "file-input"
        component_html_class: :"file-input",
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, type: :file, class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:file-input-ghost"
      # "@sm:file-input-ghost"
      # "md:file-input-ghost"
      # "@md:file-input-ghost"
      # "lg:file-input-ghost"
      # "@lg:file-input-ghost"
      ghost: "file-input-ghost",
      # "sm:file-input-xs"
      # "@sm:file-input-xs"
      # "md:file-input-xs"
      # "@md:file-input-xs"
      # "lg:file-input-xs"
      # "@lg:file-input-xs"
      xs: "file-input-xs",
      # "sm:file-input-sm"
      # "@sm:file-input-sm"
      # "md:file-input-sm"
      # "@md:file-input-sm"
      # "lg:file-input-sm"
      # "@lg:file-input-sm"
      sm: "file-input-sm",
      # "sm:file-input-md"
      # "@sm:file-input-md"
      # "md:file-input-md"
      # "@md:file-input-md"
      # "lg:file-input-md"
      # "@lg:file-input-md"
      md: "file-input-md",
      # "sm:file-input-lg"
      # "@sm:file-input-lg"
      # "md:file-input-lg"
      # "@md:file-input-lg"
      # "lg:file-input-lg"
      # "@lg:file-input-lg"
      lg: "file-input-lg",
      # "sm:file-input-xl"
      # "@sm:file-input-xl"
      # "md:file-input-xl"
      # "@md:file-input-xl"
      # "lg:file-input-xl"
      # "@lg:file-input-xl"
      xl: "file-input-xl",
      # "sm:file-input-neutral"
      # "@sm:file-input-neutral"
      # "md:file-input-neutral"
      # "@md:file-input-neutral"
      # "lg:file-input-neutral"
      # "@lg:file-input-neutral"
      neutral: "file-input-neutral",
      # "sm:file-input-primary"
      # "@sm:file-input-primary"
      # "md:file-input-primary"
      # "@md:file-input-primary"
      # "lg:file-input-primary"
      # "@lg:file-input-primary"
      primary: "file-input-primary",
      # "sm:file-input-secondary"
      # "@sm:file-input-secondary"
      # "md:file-input-secondary"
      # "@md:file-input-secondary"
      # "lg:file-input-secondary"
      # "@lg:file-input-secondary"
      secondary: "file-input-secondary",
      # "sm:file-input-accent"
      # "@sm:file-input-accent"
      # "md:file-input-accent"
      # "@md:file-input-accent"
      # "lg:file-input-accent"
      # "@lg:file-input-accent"
      accent: "file-input-accent",
      # "sm:file-input-info"
      # "@sm:file-input-info"
      # "md:file-input-info"
      # "@md:file-input-info"
      # "lg:file-input-info"
      # "@lg:file-input-info"
      info: "file-input-info",
      # "sm:file-input-success"
      # "@sm:file-input-success"
      # "md:file-input-success"
      # "@md:file-input-success"
      # "lg:file-input-success"
      # "@lg:file-input-success"
      success: "file-input-success",
      # "sm:file-input-warning"
      # "@sm:file-input-warning"
      # "md:file-input-warning"
      # "@md:file-input-warning"
      # "lg:file-input-warning"
      # "@lg:file-input-warning"
      warning: "file-input-warning",
      # "sm:file-input-error"
      # "@sm:file-input-error"
      # "md:file-input-error"
      # "@md:file-input-error"
      # "lg:file-input-error"
      # "@lg:file-input-error"
      error: "file-input-error"
    )
  end
end
