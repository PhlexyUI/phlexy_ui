require "spec_helper"

describe PhlexyUI::Dropdown do
  subject(:output) { render described_class.new }

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option as a single argument" do
        subject(:output) do
          render described_class.new(:top, responsive: {viewport => :hover})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div class="dropdown dropdown-top #{viewport}:dropdown-hover"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end

      context "when given multiple responsive options as an array" do
        subject(:output) do
          render described_class.new(:top, responsive: {viewport => [:hover, :open]})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div class="dropdown dropdown-top #{viewport}:dropdown-hover #{viewport}:dropdown-open"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

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
            <summary class="btn btn-active my-button" data-my="buttons">Click</summary>
          </details>
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "passing modifiers to the menu" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Dropdown.new do |dropdown|
            dropdown.menu(:vertical, :xs) do |menu|
              menu.item do
                a do
                  "Item 1"
                end
              end
            end
          end
        end
      end
    end

    subject(:output) { render component.new }

    it "renders the menu with the given modifiers" do
      expected_html = html <<~HTML
        <div class="dropdown">
          <ul class="menu menu-vertical menu-xs dropdown-content" tabindex="0">
            <li>
              <a>Item 1</a>
            </li>
          </ul>
        </div>
      HTML

      is_expected.to eq(expected_html)
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

            dropdown.menu do |menu|
              menu.item do
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
          <div class="btn btn-active my-button" 
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

            dropdown.menu do |menu|
              menu.item do
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
            class="btn btn-active my-button" 
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

  describe "rendering a full dropdown with card content that closes when tapping outside" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Dropdown.new(:top) do |dropdown|
            dropdown.button(:active, class: "my-button", data: {my: "buttons"}) do
              "Click"
            end

            dropdown.content as: PhlexyUI::Card do |card|
              card.body do
                card.title do
                  "Title"
                end

                p do
                  "Body"
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
          <div class="btn btn-active my-button" 
               role="button" 
               tabindex="0" 
               data-my="buttons">Click</div>
          <section class="card dropdown-content" tabindex="0">
            <div class="card-body">
              <header class="card-title">Title</header>
              <p>Body</p>
            </div>
          </section>
        </div>
      HTML

      is_expected.to eq(expected_html)
    end
  end

  describe "rendering a full dropdown with card content that closes when tapping the button" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Dropdown.new(:tap_to_close, :top) do |dropdown|
            dropdown.button(:active, class: "my-button", data: {my: "buttons"}) do
              "Click"
            end

            dropdown.content as: PhlexyUI::Card, class: "bg-base-100" do |card|
              card.body do
                card.title do
                  "Title"
                end

                p do
                  "Body"
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
            class="btn btn-active my-button" 
            data-my="buttons">Click</summary>
          <section class="card dropdown-content bg-base-100">
            <div class="card-body">
              <header class="card-title">Title</header>
              <p>Body</p>
            </div>
          </section>
        </details>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
