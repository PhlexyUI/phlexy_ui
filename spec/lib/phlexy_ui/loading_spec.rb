require "spec_helper"

describe PhlexyUI::Loading do
  subject(:output) { render described_class.new }

  describe "rendering a full loading" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Loading.new
        end
      end
    end

    subject(:output) do
      render component.new
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <span class="loading"></span>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
