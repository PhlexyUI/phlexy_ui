require "spec_helper"

describe PhlexyUI::Checkbox do
  subject(:output) { render described_class.new }

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
