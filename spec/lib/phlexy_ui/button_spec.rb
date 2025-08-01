require "spec_helper"

describe PhlexyUI::Button do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <button class="btn"></button>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "conditions" do
    {
      # Modifiers
      no_animation: "no-animation",
      glass: "glass",
      ghost: "btn-ghost",
      link: "btn-link",
      outline: "btn-outline",
      active: "btn-active",
      disabled: "btn-disabled",
      lg: "btn-lg",
      md: "btn-md",
      sm: "btn-sm",
      xs: "btn-xs",
      wide: "btn-wide",
      block: "btn-block",
      circle: "btn-circle",
      square: "btn-square",
      # Colors
      neutral: "btn-neutral",
      primary: "btn-primary",
      secondary: "btn-secondary",
      accent: "btn-accent",
      info: "btn-info",
      success: "btn-success",
      warning: "btn-warning",
      error: "btn-error"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <button class="btn #{css}"></button>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when modifier doesn't exist" do
      it "does not raise an error" do
        expect { render described_class.new(:foo) }
          .not_to raise_error
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:neutral, :primary) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <button class="btn btn-neutral btn-primary"></button>
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "data" do
    subject(:output) do
      render described_class.new(:neutral, data: {foo: "bar"})
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <button class="btn btn-neutral" data-foo="bar"></button>
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
      render described_class.new(:neutral)
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <button class="foo-btn foo-btn-neutral"></button>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option as a single argument" do
        subject(:output) do
          render described_class.new(:neutral, responsive: {viewport => :primary})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <button class="btn btn-neutral #{viewport}:btn-primary"></button>
          HTML

          expect(output).to eq(expected_html)
        end
      end

      context "when given multiple responsive options as an array" do
        subject(:output) do
          render described_class.new(:neutral, responsive: {viewport => [:primary, :active]})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <button class="
              btn
              btn-neutral
              #{viewport}:btn-primary
              #{viewport}:btn-active">
            </button>
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
          render described_class.new(:neutral, responsive: {viewport => [:primary, :active]})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <button class="
              foo-btn 
              foo-btn-neutral 
              #{viewport}:foo-btn-primary 
              #{viewport}:foo-btn-active">
            </button>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "rendering via Kit" do
    subject(:output) do
      Button(:neutral)
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <button class="btn btn-neutral"></button>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :input, type: :radio) }

    it "renders the card as the given tag" do
      expected_html = html <<~HTML
        <input class="btn" type="radio">
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :modal option" do
    subject(:output) do
      render described_class.new(
        :neutral,
        class: "my-class",
        modal: "my_modal_1",
        data: {my: "modals"}
      ) do
        "Click me"
      end
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <button 
          class="btn btn-neutral my-class" 
          onclick="my_modal_1.showModal()"
          data-my="modals">Click me</button>
      HTML

      expect(output).to eq(expected_html)
    end

    context "when using the :skeleton modifier" do
      subject(:output) do
        render described_class.new(:neutral, :skeleton)
      end

      it "renders it correctly" do
        expected_html = html <<~HTML
          <button class="btn btn-neutral skeleton"></button>
        HTML

        expect(output).to eq(expected_html)
      end
    end

    context "when passing malicious code via the modal option" do
      subject(:output) do
        render described_class.new(:neutral, modal: %(" onclick="alert('XSS') //;))
      end

      it "escapes the code" do
        expected_html = html <<~HTML
          <button 
            class="btn btn-neutral" 
            onclick="&quot; onclick=&quot;alert(&#39;XSS&#39;) //;.showModal()">
          </button>
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end
end
