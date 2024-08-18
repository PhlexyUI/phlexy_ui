# frozen_string_literal: true

module PhlexyUI
  class Base < Phlex::HTML
    def initialize(*base_modifiers, **options)
      @base_modifiers = base_modifiers
      @options = options
    end

    private

    attr_reader :base_modifiers, :options, :as, :id

    def generate_classes!(
      component_html_class: nil,
      base_modifiers: [],
      options: {},
      modifiers_map: {}
    )
      ClassList.new(
        component_html_class:,
        base_modifiers:,
        options:,
        modifiers_map:
      ).to_a.then do |classes|
        classes.any? ? classes : nil
      end
    end

    def generate_attributes(base_modifiers, attributes_map)
      AttributeSet.new(base_modifiers, attributes_map).to_h
    end

    def render_as(*, as:, **, &)
      if as.is_a?(Symbol)
        render public_send(*, as:, **, &)
      else
        render as.new(*, **, &)
      end
    end
  end
end
