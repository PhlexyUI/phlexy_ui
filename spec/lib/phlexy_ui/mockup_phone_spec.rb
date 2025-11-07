require "spec_helper"

describe PhlexyUI::MockupPhone do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="mockup-phone"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with part methods" do
    subject(:output) do
      render described_class.new do |m|
        m.camera { "Camera" }
        m.display { "Display" }
      end
    end

    it "renders all parts" do
      expected_html = html <<~HTML
        <div class="mockup-phone">
          <div class="mockup-phone-camera">Camera</div>
          <div class="mockup-phone-display">Display</div>
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
        <div class="mockup-phone" data-foo="bar"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :section) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <section class="mockup-phone"></section>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
