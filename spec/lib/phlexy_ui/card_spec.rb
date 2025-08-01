require "spec_helper"

describe PhlexyUI::Card do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <section class="card"></section>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "modifiers" do
    {
      # Modifiers
      image_full: "image-full",
      bordered: "card-bordered",
      normal: "card-normal",
      compact: "card-compact",
      side: "card-side",
      glass: "glass",
      primary: "bg-primary text-primary-content",
      secondary: "bg-secondary text-secondary-content",
      accent: "bg-accent text-accent-content",
      neutral: "bg-neutral text-neutral-content",
      base_100: "bg-base-100 text-base-content",
      base_200: "bg-base-200 text-base-content",
      base_300: "bg-base-300 text-base-content",
      info: "bg-info text-info-content",
      success: "bg-success text-success-content",
      warning: "bg-warning text-warning-content",
      error: "bg-error text-error-content"
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
      it "does not raise an error" do
        expect { render described_class.new(:foo) }
          .not_to raise_error
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

  describe "custom modifiers" do
    context "when there's a custom modifier for the component" do
      around do |example|
        PhlexyUI.configure do |config|
          config.modifiers.add(
            :my_modifier,
            component: PhlexyUI::Card,
            classes: "w-96 shadow-xl"
          )
        end

        example.run

        PhlexyUI.configure do |config|
          config.modifiers.remove(:my_modifier, component: PhlexyUI::Card)
        end
      end

      subject(:output) do
        render described_class.new(:my_modifier)
      end

      it "renders it correctly" do
        expected_html = html <<~HTML
          <section class="card w-96 shadow-xl"></section>
        HTML

        expect(output).to eq(expected_html)
      end
    end

    context "when there's a custom modifier without a specific component" do
      around do |example|
        PhlexyUI.configure do |config|
          config.modifiers.add(
            :my_modifier,
            classes: "w-96 shadow-xl"
          )
        end

        example.run

        PhlexyUI.configure do |config|
          config.modifiers.remove(:my_modifier)
        end
      end

      subject(:output) do
        render described_class.new(:my_modifier)
      end

      it "renders it correctly" do
        expected_html = html <<~HTML
          <section class="card w-96 shadow-xl"></section>
        HTML

        expect(output).to eq(expected_html)
      end
    end

    context "when there's no custom modifier" do
      subject(:output) do
        render described_class.new(:my_modifier)
      end

      it "does not render it" do
        expected_html = html <<~HTML
          <section class="card"></section>
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option as a single argument" do
        subject(:output) do
          render described_class.new(:compact, responsive: {viewport => :primary})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <section class="
              card 
              card-compact 
              #{viewport}:bg-primary 
              #{viewport}:text-primary-content">
            </section>
          HTML

          expect(output).to eq(expected_html)
        end
      end

      context "when given multiple responsive options as an array" do
        subject(:output) do
          render described_class.new(:compact, responsive: {viewport => [:normal, :primary]})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <section class="
              card 
              card-compact 
              #{viewport}:card-normal 
              #{viewport}:bg-primary
              #{viewport}:text-primary-content">
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
          render described_class.new(:compact, responsive: {viewport => [:normal, :primary]})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <section class="
              foo-card 
              foo-card-compact
              #{viewport}:foo-card-normal
              #{viewport}:foo-bg-primary
              #{viewport}:foo-text-primary-content">
            </section>
          HTML

          expect(output).to eq(expected_html)
        end
      end

      context "when there are custom modifiers" do
        around do |example|
          PhlexyUI.configure do |config|
            config.modifiers.add(
              :my_modifier,
              component: PhlexyUI::Card,
              classes: "w-96 shadow-xl"
            )

            config.modifiers.add(
              :my_other_modifier,
              classes: "p-4 rounded-box"
            )
          end

          example.run

          PhlexyUI.configure do |config|
            config.modifiers.remove(:my_modifier, component: PhlexyUI::Card)
            config.modifiers.remove(:my_other_modifier)
          end
        end

        subject(:output) do
          render described_class.new(
            :my_modifier,
            responsive: {viewport => :my_other_modifier}
          )
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <section class="
              card
              w-96
              shadow-xl
              #{viewport}:p-4
              #{viewport}:rounded-box">
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
