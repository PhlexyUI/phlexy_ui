require "spec_helper"

describe PhlexyUI::Timeline do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <ul class="timeline"></ul>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with part methods" do
    subject(:output) do
      render described_class.new do |t|
        t.start { "Start" }
        t.middle { "Middle" }
        t.end { "End" }
      end
    end

    it "renders all parts" do
      expected_html = html <<~HTML
        <ul class="timeline">
          <div class="timeline-start">Start</div>
          <div class="timeline-middle">Middle</div>
          <div class="timeline-end">End</div>
        </ul>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "conditions" do
    {
      snap_icon: "timeline-snap-icon",
      box: "timeline-box",
      compact: "timeline-compact",
      vertical: "timeline-vertical",
      horizontal: "timeline-horizontal"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <ul class="timeline #{css}"></ul>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:vertical, :box) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <ul class="timeline timeline-vertical timeline-box"></ul>
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
        <ul class="timeline" data-foo="bar"></ul>
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
            <ul class="timeline timeline-vertical #{viewport}:timeline-horizontal"></ul>
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
        <div class="timeline"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
