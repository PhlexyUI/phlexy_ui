require "spec_helper"

describe PhlexyUI::Carousel do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="carousel"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with item method" do
    subject(:output) do
      render described_class.new do |c|
        c.item { "Item 1" }
        c.item { "Item 2" }
      end
    end

    it "renders items" do
      expected_html = html <<~HTML
        <div class="carousel">
          <div class="carousel-item">Item 1</div>
          <div class="carousel-item">Item 2</div>
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "conditions" do
    {
      start: "carousel-start",
      center: "carousel-center",
      end: "carousel-end",
      vertical: "carousel-vertical"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <div class="carousel #{css}"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:center, :vertical) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <div class="carousel carousel-center carousel-vertical"></div>
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
        <div class="carousel" data-foo="bar"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option" do
        subject(:output) do
          render described_class.new(:start, responsive: {viewport => :center})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div class="carousel carousel-start #{viewport}:carousel-center"></div>
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
        <section class="carousel"></section>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
