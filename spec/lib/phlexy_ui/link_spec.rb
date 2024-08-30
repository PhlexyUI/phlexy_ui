require "spec_helper"

describe PhlexyUI::Link do
  subject(:output) { render described_class.new }

  describe "rendering a full link" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Link.new(
            :active,
            href: "/test",
            class: "test",
            data: {my: "data"}
          ) do
            span do
              "Link text"
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
        <a class="active test" href="/test" data-my="data">
          <span>Link text</span>
        </a>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
