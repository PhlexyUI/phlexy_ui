require "spec_helper"

describe PhlexyUI::Avatar do
  subject(:output) { render described_class.new }

  describe "rendering a full avatar" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Avatar.new(:online, offline: false, placeholder: true) do
            div class: "w-24 rounded" do
              img src: "some-image.jpg"
            end
          end
        end
      end
    end

    subject(:output) do
      render component.new
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <div class="avatar online placeholder">
          <div class="w-24 rounded">
            <img src="some-image.jpg">
          </div>
        </div>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
