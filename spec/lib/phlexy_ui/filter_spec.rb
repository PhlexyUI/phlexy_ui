require "spec_helper"

describe PhlexyUI::Filter do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="filter"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with reset method" do
    subject(:output) do
      render described_class.new do |f|
        f.reset(name: "filter")
      end
    end

    it "renders reset" do
      expected_html = html <<~HTML
        <div class="filter">
          <input type="radio" class="filter-reset" name="filter">
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
        <div class="filter" data-foo="bar"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :form) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <form class="filter"></form>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
