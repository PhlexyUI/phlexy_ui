require "spec_helper"

describe PhlexyUI::Mask do
  subject(:output) { render described_class.new }

  describe "rendering a full mask" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Mask.new(:squircle, heart: false, hexagon: true) do
          end
        end
      end
    end

    subject(:output) do
      render component.new
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <div class="mask mask-squircle mask-hexagon"></div>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
