# frozen_string_literal: true

module PhlexyUI
  # @private
  class Tab < Base
    include Phlex::DeferredRender

    def initialize(*, id: nil, **)
      super(*, **)
      @id = id
    end

    def view_template(&)
      if @content
        render TabWithContent.new(
          *base_modifiers,
          id:,
          content: @content,
          **options,
          &
        )
      else
        render TabWithoutContent.new(*base_modifiers, id:, **options, &)
      end
    end

    def content(*, **options, &)
      unless id
        raise ArgumentError,
          "You must pass an id to Tabs#new if you want to add content"
      end

      @content = -> do
        generate_classes!(
          component_html_class: :"tab-content",
          options:
        ).then do |classes|
          div role: :tabpanel, class: classes, **options, &
        end
      end
    end

    private

    TAB_MODIFIERS_CLASSES = {
      # "sm:tab-active"
      # "md:tab-active"
      # "lg:tab-active"
      active: "tab-active",
      # "sm:tab-disabled"
      # "md:tab-disabled"
      # "lg:tab-disabled"
      disabled: "tab-disabled"
    }.freeze
  end
end
