require "spec_helper"

describe PhlexyUI::Stack do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="stack"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "conditions" do
    {
      top: "stack-top",
      bottom: "stack-bottom",
      start: "stack-start",
      end: "stack-end"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <div class="stack #{css}"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:top, :end) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <div class="stack stack-top stack-end"></div>
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
        <div class="stack" data-foo="bar"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option" do
        subject(:output) do
          render described_class.new(:top, responsive: {viewport => :bottom})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div class="stack stack-top #{viewport}:stack-bottom"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :section) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <section class="stack"></section>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
