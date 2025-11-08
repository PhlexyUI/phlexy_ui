require "spec_helper"

describe "modifiers inheritance" do
  let(:phlexy_ui_class) do
    Class.new(PhlexyUI::Base) do
      def view_template(&)
        generate_classes!(
          component_html_class: "base-component",
          modifiers_map: modifiers,
          base_modifiers:,
          options:
        ).then do |classes|
          div(class: classes, **options, &)
        end
      end

      register_modifiers(
        primary: "base-modifier-value"
      )
    end
  end

  let(:custom_component_class) do
    Class.new(phlexy_ui_class) do
      register_modifiers(
        custom_modifier: "custom-modifier-value"
      )
    end
  end

  before do
    stub_const("CustomComponent", custom_component_class)
  end

  describe "rendering a custom component" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          # Ensuring :primary does not override other components
          render PhlexyUI::Button.new(:primary)
          render CustomComponent.new(
            :primary,
            :custom_modifier
          ) do
            "Custom"
          end
        end
      end
    end

    subject(:output) do
      render component.new
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <button class="btn btn-primary"></button>
        <div class="base-component base-modifier-value custom-modifier-value">Custom</div>
      HTML

      is_expected.to eq(expected_html)
    end
  end

  describe "sibling classes don't interfere with each other" do
    let(:parent_class) do
      Class.new(PhlexyUI::Base) do
        def view_template(&)
          generate_classes!(
            component_html_class: "parent-component",
            modifiers_map: modifiers,
            base_modifiers:,
            options:
          ).then do |classes|
            div(class: classes, **options, &)
          end
        end

        register_modifiers(
          inherited_modifier: "parent-modifier"
        )
      end
    end

    let(:sibling_a_class) do
      Class.new(parent_class) do
        def view_template(&)
          generate_classes!(
            component_html_class: "sibling-a",
            modifiers_map: modifiers,
            base_modifiers:,
            options:
          ).then do |classes|
            div(class: classes, **options, &)
          end
        end

        register_modifiers(
          primary: "sibling-a-primary",
          unique_a: "unique-to-a"
        )
      end
    end

    let(:sibling_b_class) do
      Class.new(parent_class) do
        def view_template(&)
          generate_classes!(
            component_html_class: "sibling-b",
            modifiers_map: modifiers,
            base_modifiers:,
            options:
          ).then do |classes|
            div(class: classes, **options, &)
          end
        end

        register_modifiers(
          primary: "sibling-b-primary",
          unique_b: "unique-to-b"
        )
      end
    end

    before do
      stub_const("SiblingA", sibling_a_class)
      stub_const("SiblingB", sibling_b_class)
    end

    it "each sibling maintains its own modifiers independently" do
      component = Class.new(Phlex::HTML) do
        def view_template
          render SiblingA.new(:inherited_modifier, :primary, :unique_a)
          render SiblingB.new(:inherited_modifier, :primary, :unique_b)
        end
      end

      output = render component.new

      expected_html = html <<~HTML
        <div class="sibling-a parent-modifier sibling-a-primary unique-to-a"></div>
        <div class="sibling-b parent-modifier sibling-b-primary unique-to-b"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
