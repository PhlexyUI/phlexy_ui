require "spec_helper"

describe PhlexyUI::Steps do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <ul class="steps"></ul>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with step and icon methods" do
    subject(:output) do
      render described_class.new do |s|
        s.step { "Step 1" }
        s.step { "Step 2" }
        s.icon { "Icon" }
      end
    end

    it "renders all parts" do
      expected_html = html <<~HTML
        <ul class="steps">
          <li class="step">Step 1</li>
          <li class="step">Step 2</li>
          <div class="step-icon">Icon</div>
        </ul>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "conditions" do
    {
      vertical: "steps-vertical",
      horizontal: "steps-horizontal"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <ul class="steps #{css}"></ul>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "step colors" do
    {
      neutral: "step-neutral",
      primary: "step-primary",
      secondary: "step-secondary",
      accent: "step-accent",
      info: "step-info",
      success: "step-success",
      warning: "step-warning",
      error: "step-error"
    }.each do |color, css|
      context "when step is given :#{color} modifier" do
        subject(:output) do
          render described_class.new do |s|
            s.step(color) { "Step 1" }
          end
        end

        it "renders step with color class" do
          expected_html = html <<~HTML
            <ul class="steps">
              <li class="step #{css}">Step 1</li>
            </ul>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "data" do
    subject(:output) do
      render described_class.new(data: {foo: "bar"})
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <ul class="steps" data-foo="bar"></ul>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option" do
        subject(:output) do
          render described_class.new(:vertical, responsive: {viewport => :horizontal})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <ul class="steps steps-vertical #{viewport}:steps-horizontal"></ul>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :ol) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <ol class="steps"></ol>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
