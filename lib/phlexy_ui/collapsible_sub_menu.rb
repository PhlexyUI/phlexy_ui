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

      details(**attributes) do
        if @title
          summary do
            render @title
          end
        else
          raise ArgumentError, "A collapsible submenu requires a title"
        end

        if @items.any?
          ul do
            @items.each do |item|
              render item
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
  end
end
