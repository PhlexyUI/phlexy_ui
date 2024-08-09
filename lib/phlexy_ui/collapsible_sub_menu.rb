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
      attributes = ATTRIBUTES_MAP.select do |key|
        base_modifiers.include?(key)
      end

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
              li do
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

    def item(&block)
      @items << block
    end

    def submenu(*, **, &)
      @items << self.class.new(*, **, &)
    end

    private

    ATTRIBUTES_MAP = {
      open: true
    }.freeze
  end
end
