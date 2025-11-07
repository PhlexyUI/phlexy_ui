require "spec_helper"

describe PhlexyUI::Diff do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <figure class="diff"></figure>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with part methods" do
    subject(:output) do
      render described_class.new do |d|
        d.item_1 { "Item 1" }
        d.resizer
        d.item_2 { "Item 2" }
      end
    end

    it "renders all parts" do
      expected_html = html <<~HTML
        <figure class="diff">
          <div class="diff-item-1">Item 1</div>
          <div class="diff-resizer"></div>
          <div class="diff-item-2">Item 2</div>
        </figure>
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
        <figure class="diff" data-foo="bar"></figure>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :div) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <div class="diff"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
