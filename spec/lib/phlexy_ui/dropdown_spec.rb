require "spec_helper"

describe PhlexyUI::Dropdown do
  subject(:output) { render described_class.new }

  describe "conditions" do
    {
      end: "dropdown-end",
      top: "dropdown-top",
      bottom: "dropdown-bottom",
      left: "dropdown-left",
      right: "dropdown-right",
      hover: "dropdown-hover",
      open: "dropdown-open"
    }.each do |condition, css|
      context "when given :#{condition} condition" do
        subject(:output) { render described_class.new(condition) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <div class="dropdown #{css}"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :div) }

    it "renders the dropdown as the given tag" do
      expected_html = html <<~HTML
        <div class="dropdown"></div>
      HTML

      expect(output).to eq(expected_html)
    end

    context "when using details as the :as option" do
      subject(:output) do
        render described_class.new(as: :details) do |dropdown|
          dropdown.button(:active, class: "my-button", data: {my: "buttons"}) do
            "Click"
          end
        end
      end

      it "renders the dropdown content as a summary tag" do
        expected_html = html <<~HTML
          <details class="dropdown">
            <summary class="btn btn-active my-button" tabindex="0" data-my="buttons">Click</summary>
          </details>
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "rendering a full dropdown" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Dropdown.new(:top) do |dropdown|
            dropdown.button(:active, class: "my-button", data: {my: "buttons"}) do
              "Click"
            end

            dropdown.content(as: :ul) do |content|
              li do
                a do
                  "Item 1"
                end
              end
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
        <div class="dropdown dropdown-top">
          <button class="btn btn-active my-button" tabindex="0" data-my="buttons">Click</button>
          <ul tabindex="0" class="dropdown-content">
            <li>
              <a>Item 1</a>
            </li>
          </ul>
        </div>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
