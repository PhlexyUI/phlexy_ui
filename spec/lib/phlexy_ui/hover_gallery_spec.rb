require "spec_helper"

describe PhlexyUI::HoverGallery do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <figure class="hover-gallery"></figure>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "data" do
    subject(:output) do
      render described_class.new(data: {foo: "bar"})
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <figure class="hover-gallery" data-foo="bar"></figure>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :div) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <div class="hover-gallery"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
