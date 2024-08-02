require "spec_helper"

describe PhlexyUI::Card do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <section class="card"></section>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "conditions" do
    {
      # Modifiers
      image_full: "image-full",
      bordered: "card-bordered",
      normal: "card-normal",
      compact: "card-compact",
      side: "card-side"
    }.each do |condition, css|
      context "when given :#{condition} condition" do
        subject(:output) { render described_class.new(condition) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <section class="card #{css}"></section>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when condition doesn't exist" do
      it "raises an error" do
        expect { render described_class.new(:foo) }
          .to raise_error(
            ArgumentError,
            "Condition `foo` is not defined for PhlexyUI::Card"
          )
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:compact, :bordered) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <section class="card card-compact card-bordered"></section>
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "data" do
    subject(:output) do
      render described_class.new(:compact, data: {foo: "bar"})
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <section class="card card-compact" data-foo="bar"></section>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "prefix" do
    around do |example|
      original_prefix = PhlexyUI.configuration.prefix

      PhlexyUI.configure do |config|
        config.prefix = "foo-"
      end

      example.run

      PhlexyUI.configure do |config|
        config.prefix = original_prefix
      end
    end

    subject(:output) do
      render described_class.new(:compact)
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <section class="foo-card foo-card-compact"></section>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "responsiveness" do
    %i[sm md lg].each do |viewport|
      context "when given an :#{viewport} responsive option as a single argument" do
        subject(:output) do
          render described_class.new(:compact, viewport => :bordered)
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <section class="card card-compact #{viewport}:card-bordered">
            </section>
          HTML

          expect(output).to eq(expected_html)
        end
      end

      context "when given multiple responsive options as an array" do
        subject(:output) do
          render described_class.new(:compact, viewport => [:normal, :bordered])
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <section class="
              card 
              card-compact 
              #{viewport}:card-normal 
              #{viewport}:card-bordered">
            </section>
          HTML

          expect(output).to eq(expected_html)
        end
      end

      context "when it's prefixed" do
        around do |example|
          original_prefix = PhlexyUI.configuration.prefix

          PhlexyUI.configure do |config|
            config.prefix = "foo-"
          end

          example.run

          PhlexyUI.configure do |config|
            config.prefix = original_prefix
          end
        end

        subject(:output) do
          render described_class.new(:compact, viewport => [:normal, :bordered])
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <section class="
              foo-card 
              foo-card-compact 
              #{viewport}:foo-card-normal 
              #{viewport}:foo-card-bordered">
            </section>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "rendering via Kit" do
    subject(:output) do
      Card(:compact)
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <section class="card card-compact"></section>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :div) }

    it "renders the card as the given tag" do
      expected_html = html <<~HTML
        <div class="card"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "rendering a full card" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Card.new(:compact) do |card|
            card.body class: "my-body", data: {my: "bodies"}, style: "color: red;" do
              card.figure class: "my-figure", data: {my: "figures"} do
                card.img src: "image.jpg"
              end

              card.title class: "my-title", data: {my: "titles"} do
                h1 { "My title" }
              end

              card.actions class: "my-actions", data: {my: "actions"} do
                div { "My actions" }
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
        <section class="card card-compact">
          <div class="card-body my-body" data-my="bodies" style="color: red;">
            <figure class="my-figure" data-my="figures">
              <img src="image.jpg">
            </figure>
            <header class="card-title my-title" data-my="titles">
              <h1>My title</h1>
            </header>
            <footer class="card-actions my-actions" data-my="actions">
              <div>My actions</div>
            </footer>
          </div>
        </section>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
