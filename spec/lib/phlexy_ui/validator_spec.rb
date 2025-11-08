require "spec_helper"

describe PhlexyUI::Validator do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <input class="validator">
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with hint method" do
    subject(:output) do
      render described_class.new do |v|
        v.hint { "Hint text" }
      end
    end

    it "renders hint" do
      expected_html = html <<~HTML
        <input class="validator">
        <p class="validator-hint">Hint text</p>
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
        <input class="validator" data-foo="bar">
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :div) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <div class="validator"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
