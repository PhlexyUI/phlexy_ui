require "spec_helper"

describe PhlexyUI::Hero do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="hero"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with part methods" do
    subject(:output) do
      render described_class.new do |h|
        h.content { "Content" }
        h.overlay { "Overlay" }
      end
    end

    it "renders all parts" do
      expected_html = html <<~HTML
        <div class="hero">
          <div class="hero-content">Content</div>
          <div class="hero-overlay">Overlay</div>
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "data" do
    subject(:output) do
      render described_class.new(data: {foo: "bar"})
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <div class="hero" data-foo="bar"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :section) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <section class="hero"></section>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
