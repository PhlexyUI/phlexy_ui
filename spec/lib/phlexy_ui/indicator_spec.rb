require "spec_helper"

describe PhlexyUI::Indicator do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="indicator"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with item" do
    subject(:output) do
      render described_class.new do |i|
        i.item { "Badge 1" }
        i.item { "Badge 2" }
      end
    end

    it "renders item" do
      expected_html = html <<~HTML
        <div class="indicator">
          <span class="indicator-item">Badge 1</span>
          <span class="indicator-item">Badge 2</span>
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
      context "when given :#{modifier} modifier on an item" do
        subject(:output) do
          render described_class.new do |indicator|
            indicator.item modifier
          end
        end

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <div class="indicator">
              <span class="indicator-item #{css}"></span>
            </div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions on an item" do
      subject(:output) do
        render described_class.new do |indicator|
          indicator.item :top, :end
        end
      end

      it "renders them separately" do
        expected_html = html <<~HTML
          <div class="indicator">
            <span class="indicator-item indicator-top indicator-end"></span>
          </div>
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "data" do
    subject(:output) do
      render described_class.new(data: {foo: "bar"}) do |indicator|
        indicator.item data: {baz: "qux"}
      end
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <div class="indicator" data-foo="bar">
          <span class="indicator-item" data-baz="qux"></span>
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option" do
        subject(:output) do
          render described_class.new do |indicator|
            indicator.item responsive: {viewport => :bottom}
            indicator.item responsive: {viewport => true}
          end
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div class="indicator">
              <span class="indicator-item #{viewport}:indicator-bottom"></span>
              <span class="#{viewport}:indicator-item"></span>
            </div>
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
        <div class="indicator"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "rendering via Kit" do
    subject(:output) do
      Indicator do |indicator|
        indicator.item :top
      end
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <div class="indicator">
          <span class="indicator-item indicator-top"></span>
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "rendering a full indicator" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          # Ignores :top modifier on the main component
          render PhlexyUI::Indicator.new(:top, data: {foo: "bar"}) do |i|
            i.item(:top, :start, class: "badge", data: {baz: "qux"}) { "↖︎" }
            i.item(:top, :center, class: "badge") { "↑" }
            i.item(:top, :end, class: "badge") { "↗︎" }
            i.item(:middle, :start, class: "badge") { "←" }
            i.item(:middle, :center, class: "badge") { "●" }
            i.item(:middle, :end, class: "badge") { "→" }
            i.item(:bottom, :start, class: "badge") { "↙︎" }
            i.item(:bottom, :center, class: "badge") { "↓" }
            i.item(:bottom, :end, class: "badge") { "↘︎" }
            div(class: "bg-base-300 grid h-32 w-60 place-items-center") do
              "Box"
            end
          end
        end
      end
    end

    subject(:output) do
      render component.new
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <div class="indicator" data-foo="bar">
          <span class="indicator-item indicator-top indicator-start badge" data-baz="qux">↖︎</span>
          <span class="indicator-item indicator-top indicator-center badge">↑</span>
          <span class="indicator-item indicator-top indicator-end badge">↗︎</span>
          <span class="indicator-item indicator-middle indicator-start badge">←</span>
          <span class="indicator-item indicator-middle indicator-center badge">●</span>
          <span class="indicator-item indicator-middle indicator-end badge">→</span>
          <span class="indicator-item indicator-bottom indicator-start badge">↙︎</span>
          <span class="indicator-item indicator-bottom indicator-center badge">↓</span>
          <span class="indicator-item indicator-bottom indicator-end badge">↘︎</span>
          <div class="bg-base-300 grid h-32 w-60 place-items-center">Box</div>
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
