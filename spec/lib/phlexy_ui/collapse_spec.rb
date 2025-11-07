require "spec_helper"

describe PhlexyUI::Collapse do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="collapse"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with part methods" do
    subject(:output) do
      render described_class.new do |c|
        c.title { "Title" }
        c.content { "Content" }
      end
    end

    it "renders all parts" do
      expected_html = html <<~HTML
        <div class="collapse">
          <div class="collapse-title">Title</div>
          <div class="collapse-content">Content</div>
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "conditions" do
    {
      arrow: "collapse-arrow",
      plus: "collapse-plus",
      open: "collapse-open",
      close: "collapse-close"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <div class="collapse #{css}"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:arrow, :open) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <div class="collapse collapse-arrow collapse-open"></div>
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
        <div class="collapse" data-foo="bar"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option" do
        subject(:output) do
          render described_class.new(:arrow, responsive: {viewport => :plus})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div class="collapse collapse-arrow #{viewport}:collapse-plus"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :details) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <details class="collapse"></details>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
