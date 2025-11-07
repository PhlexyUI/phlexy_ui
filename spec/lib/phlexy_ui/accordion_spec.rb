require "spec_helper"

describe PhlexyUI::Accordion do
  subject(:output) { render described_class.new(name: "accordion-1") }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="collapse">
        <input type="radio" name="accordion-1">
      </div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with title block" do
    subject(:output) do
      render described_class.new(name: "accordion-1") do |a|
        a.title { "Title" }
        "Content"
      end
    end

    it "renders title and content" do
      expected_html = html <<~HTML
        <div class="collapse">
          <input type="radio" name="accordion-1">
          <div class="collapse-title">Title</div>
          <div class="collapse-content">Content</div>
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "with checked parameter" do
    subject(:output) do
      render described_class.new(name: "accordion-1", checked: true)
    end

    it "renders checked input" do
      expected_html = html <<~HTML
        <div class="collapse">
          <input type="radio" name="accordion-1" checked>
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
        subject(:output) { render described_class.new(modifier, name: "accordion-1") }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <div class="collapse #{css}">
              <input type="radio" name="accordion-1">
            </div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:arrow, :open, name: "accordion-1") }

      it "renders them separately" do
        expected_html = html <<~HTML
          <div class="collapse collapse-arrow collapse-open">
            <input type="radio" name="accordion-1">
          </div>
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "data" do
    subject(:output) do
      render described_class.new(name: "accordion-1", data: {foo: "bar"})
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <div class="collapse" data-foo="bar">
          <input type="radio" name="accordion-1">
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option" do
        subject(:output) do
          render described_class.new(:arrow, name: "accordion-1", responsive: {viewport => :plus})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div class="collapse collapse-arrow #{viewport}:collapse-plus">
              <input type="radio" name="accordion-1">
            </div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(name: "accordion-1", as: :section) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <section class="collapse">
          <input type="radio" name="accordion-1">
        </section>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
