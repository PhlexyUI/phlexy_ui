require "spec_helper"

describe PhlexyUI::Toggle do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <input type="checkbox" class="toggle">
    HTML

    is_expected.to eq(expected_html)
  end

  describe "conditions" do
    {
      xs: "toggle-xs",
      sm: "toggle-sm",
      md: "toggle-md",
      lg: "toggle-lg",
      xl: "toggle-xl",
      primary: "toggle-primary",
      secondary: "toggle-secondary",
      accent: "toggle-accent",
      neutral: "toggle-neutral",
      success: "toggle-success",
      warning: "toggle-warning",
      info: "toggle-info",
      error: "toggle-error"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <input type="checkbox" class="toggle #{css}">
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:primary, :lg) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <input type="checkbox" class="toggle toggle-primary toggle-lg">
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "data" do
    subject(:output) do
      render described_class.new(data: {foo: "bar"})
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <input type="checkbox" class="toggle" data-foo="bar">
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option" do
        subject(:output) do
          render described_class.new(:primary, responsive: {viewport => :secondary})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <input type="checkbox" class="toggle toggle-primary #{viewport}:toggle-secondary">
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :div) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <div type="checkbox" class="toggle"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
