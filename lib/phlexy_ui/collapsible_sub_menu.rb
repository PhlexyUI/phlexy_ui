# frozen_string_literal: true

module PhlexyUI
  # @private
  class CollapsibleSubMenu < Base
    include Phlex::DeferredRender

    def initialize(*, **)
      super
      @items ||= []
    end

    def view_template(&)
      attributes = generate_attributes(base_modifiers, ATTRIBUTES_MAP)

      generate_classes!(
        base_modifiers:,
        modifiers_map: modifiers,
        options:
      ).then do |classes|
        details(**attributes) do
          if @title
            summary do
              render @title
            end
          else
            raise ArgumentError, "A collapsible submenu requires a title"
          end

          if @items.any?
            ul class: classes, **options do
              @items.each do |item|
                render item
              end
            end
          end
        end
      end
    end

    def title(&block)
      if @title
        raise ArgumentError, "A collapsible submenu can only have one title"
      else
        @title = block
      end
    end

    def item(*, **, &)
      @items << MenuItem.new(*, **, &)
    end

    private

    ATTRIBUTES_MAP = {
      open: true
    }.freeze

    register_modifiers(
      # "sm:bg-primary sm:text-primary-content"
      # "md:bg-primary md:text-primary-content"
      # "lg:bg-primary lg:text-primary-content"
      primary: "bg-primary text-primary-content",
      # "sm:bg-secondary sm:text-secondary-content"
      # "md:bg-secondary md:text-secondary-content"
      # "lg:bg-secondary lg:text-secondary-content"
      secondary: "bg-secondary text-secondary-content",
      # "sm:bg-accent sm:text-accent-content"
      # "md:bg-accent md:text-accent-content"
      # "lg:bg-accent lg:text-accent-content"
      accent: "bg-accent text-accent-content",
      # "sm:bg-neutral sm:text-neutral-content"
      # "md:bg-neutral md:text-neutral-content"
      # "lg:bg-neutral lg:text-neutral-content"
      neutral: "bg-neutral text-neutral-content",
      # "sm:bg-base-100 sm:text-base-content"
      # "md:bg-base-100 md:text-base-content"
      # "lg:bg-base-100 lg:text-base-content"
      base_100: "bg-base-100 text-base-content",
      # "sm:bg-base-200 sm:text-base-content"
      # "md:bg-base-200 md:text-base-content"
      # "lg:bg-base-200 lg:text-base-content"
      base_200: "bg-base-200 text-base-content",
      # "sm:bg-base-300 sm:text-base-content"
      # "md:bg-base-300 md:text-base-content"
      # "lg:bg-base-300 lg:text-base-content"
      base_300: "bg-base-300 text-base-content",
      # "sm:bg-info sm:text-info-content"
      # "md:bg-info sm:text-info-content"
      # "lg:bg-info sm:text-info-content"
      info: "bg-info text-info-content",
      # "sm:bg-success sm:text-success-content"
      # "md:bg-success md:text-success-content"
      # "lg:bg-success lg:text-success-content"
      success: "bg-success text-success-content",
      # "sm:bg-warning sm:text-warning-content"
      # "md:bg-warning md:text-warning-content"
      # "lg:bg-warning lg:text-warning-content"
      warning: "bg-warning text-warning-content",
      # "sm:bg-error sm:text-error-content"
      # "md:bg-error md:text-error-content"
      # "lg:bg-error lg:text-error-content"
      error: "bg-error text-error-content"
    )
  end
end
