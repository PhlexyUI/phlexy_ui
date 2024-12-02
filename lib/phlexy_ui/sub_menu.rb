# frozen_string_literal: true

module PhlexyUI
  # @private
  class SubMenu < Base
    def initialize(*, **)
      super
      @items ||= []
    end

    def view_template(&)
      if @title
        div do
          render @title
        end
      end

      if @items.any?
        ul do
          @items.each do |item|
            render item
          end
        end
      end
    end

    def title(&block)
      @title = block
    end

    def item(*, **, &)
      @items << MenuItem.new(*, **, &)
    end

    private 

    def before_template(&)
      vanish(&)
      super
    end
  end
end
