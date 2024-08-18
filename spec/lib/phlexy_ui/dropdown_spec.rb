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
        render described_class.new(:tap_to_close) do |dropdown|
          dropdown.button(:active, class: "my-button", data: {my: "buttons"}) do
            "Click"
          end
        end
      end

      it "renders the dropdown content as a summary tag" do
        expected_html = html <<~HTML
          <details class="dropdown">
            <summary class="btn btn-active my-button mb-1" data-my="buttons">Click</summary>
          </details>
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "rendering a full dropdown that closes when tapping outside" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Dropdown.new(:top) do |dropdown|
            dropdown.button(:active, class: "my-button", data: {my: "buttons"}) do
              "Click"
            end

            dropdown.content do |content|
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
          <div class="btn btn-active my-button mb-1" 
               role="button" 
               tabindex="0" 
               data-my="buttons">Click</div>
          <ul class="menu dropdown-content" tabindex="0">
            <li>
              <a>Item 1</a>
            </li>
          </ul>
        </div>
      HTML

      is_expected.to eq(expected_html)
    end
  end

  describe "rendering a full dropdown that closes when tapping the button" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Dropdown.new(:tap_to_close, :top) do |dropdown|
            dropdown.button(:active, class: "my-button", data: {my: "buttons"}) do
              "Click"
            end

            dropdown.content do |content|
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
        <details class="dropdown dropdown-top">
          <summary 
            class="btn btn-active my-button mb-1" 
            data-my="buttons">Click</summary>
          <ul class="menu dropdown-content">
            <li>
              <a>Item 1</a>
            </li>
          </ul>
        </details>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
