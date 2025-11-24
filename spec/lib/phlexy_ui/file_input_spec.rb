require "spec_helper"

describe PhlexyUI::FileInput do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <input type="file" class="file-input">
    HTML

    is_expected.to eq(expected_html)
  end

  describe "conditions" do
    {
      ghost: "file-input-ghost",
      xs: "file-input-xs",
      sm: "file-input-sm",
      md: "file-input-md",
      lg: "file-input-lg",
      xl: "file-input-xl",
      neutral: "file-input-neutral",
      primary: "file-input-primary",
      secondary: "file-input-secondary",
      accent: "file-input-accent",
      info: "file-input-info",
      success: "file-input-success",
      warning: "file-input-warning",
      error: "file-input-error"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <input type="file" class="file-input #{css}">
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:primary, :lg) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <input type="file" class="file-input file-input-primary file-input-lg">
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
        <input type="file" class="file-input" data-foo="bar">
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
            <input type="file" class="file-input file-input-primary #{viewport}:file-input-secondary">
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :button) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <button type="file" class="file-input"></button>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
