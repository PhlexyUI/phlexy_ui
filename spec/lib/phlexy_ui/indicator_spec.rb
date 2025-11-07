require "spec_helper"

describe PhlexyUI::Indicator do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="indicator"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with item method" do
    subject(:output) do
      render described_class.new do |i|
        i.item { "Badge" }
      end
    end

    it "renders item" do
      expected_html = html <<~HTML
        <div class="indicator">
          <span class="indicator-item">Badge</span>
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "conditions" do
    {
      start: "indicator-start",
      center: "indicator-center",
      end: "indicator-end",
      top: "indicator-top",
      middle: "indicator-middle",
      bottom: "indicator-bottom"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <div class="indicator #{css}"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:top, :end) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <div class="indicator indicator-top indicator-end"></div>
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
        <div class="indicator" data-foo="bar"></div>
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
            <div class="indicator indicator-top #{viewport}:indicator-bottom"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :span) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <span class="indicator"></span>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
