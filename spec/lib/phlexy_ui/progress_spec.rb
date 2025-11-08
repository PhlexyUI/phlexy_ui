require "spec_helper"

describe PhlexyUI::Progress do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <progress class="progress"></progress>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "conditions" do
    {
      neutral: "progress-neutral",
      primary: "progress-primary",
      secondary: "progress-secondary",
      accent: "progress-accent",
      info: "progress-info",
      success: "progress-success",
      warning: "progress-warning",
      error: "progress-error"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <progress class="progress #{css}"></progress>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:primary, :neutral) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <progress class="progress progress-primary progress-neutral"></progress>
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
        <progress class="progress" data-foo="bar"></progress>
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
            <progress class="progress progress-primary #{viewport}:progress-secondary"></progress>
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
        <div class="progress"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
