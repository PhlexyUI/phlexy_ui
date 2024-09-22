require "spec_helper"

describe PhlexyUI::Label do
  subject(:output) { render described_class.new }

  describe "rendering a label" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Label.new do |label|
            label.text class: "foo", data: {my: :foos} do
              "Username"
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
        <label class="label">
          <span class="label-text foo" data-my="foos">Username</span>
        </label>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
