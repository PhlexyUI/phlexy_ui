require "spec_helper"

describe PhlexyUI::Badge do
  subject(:output) { render described_class.new }

  describe "rendering a full badge" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Badge.new(:neutral, primary: false, secondary: true) do
            div do
              "+"
            end

            plain "Badge"
          end
        end
      end
    end

    subject(:output) do
      render component.new
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <span class="badge badge-neutral badge-secondary"><div>+</div>Badge</span>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
