require "spec_helper"

describe PhlexyUI::Checkbox do
  subject(:output) { render described_class.new }

  describe "conditional attributes" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Checkbox.new(:checked, disabled: true)
          render PhlexyUI::Checkbox.new(:disabled, checked: true)
          render PhlexyUI::Checkbox.new(checked: true, disabled: true)
          render PhlexyUI::Checkbox.new(checked: false, disabled: true)
          render PhlexyUI::Checkbox.new(checked: true, disabled: false)
          render PhlexyUI::Checkbox.new(checked: false, disabled: false)
        end
      end
    end

    subject(:output) do
      render component.new
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <input type="checkbox" class="checkbox" checked disabled>
        <input type="checkbox" class="checkbox" checked disabled>
        <input type="checkbox" class="checkbox" checked disabled>
        <input type="checkbox" class="checkbox" disabled>
        <input type="checkbox" class="checkbox" checked>
        <input type="checkbox" class="checkbox">
      HTML

      is_expected.to eq(expected_html)
    end
  end

  describe "rendering a full checkbox" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Checkbox.new(
            :primary,
            :checked,
            :disabled,
            lg: true
          )
        end
      end
    end

    subject(:output) do
      render component.new
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <input type="checkbox" class="checkbox checkbox-primary checkbox-lg" checked disabled>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
