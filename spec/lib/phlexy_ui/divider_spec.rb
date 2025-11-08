require "spec_helper"

describe PhlexyUI::Divider do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="divider"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "conditions" do
    {
      vertical: "divider-vertical",
      horizontal: "divider-horizontal",
      start: "divider-start",
      end: "divider-end",
      neutral: "divider-neutral",
      primary: "divider-primary",
      secondary: "divider-secondary",
      accent: "divider-accent",
      success: "divider-success",
      warning: "divider-warning",
      info: "divider-info",
      error: "divider-error"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <div class="divider #{css}"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:vertical, :primary) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <div class="divider divider-vertical divider-primary"></div>
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
        <div class="divider" data-foo="bar"></div>
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
            <div class="divider divider-vertical #{viewport}:divider-horizontal"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :hr) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <hr class="divider">
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
