# frozen_string_literal: true

module PhlexyUI
  # @private
  class Tab < Base
    def initialize(*, id: nil, **)
      super(*, **)
      @id = id
    end

    def view_template(&)
      yield(self) if block_given?

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
  end
end
