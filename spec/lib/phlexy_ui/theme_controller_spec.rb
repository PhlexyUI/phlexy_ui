require "spec_helper"

describe PhlexyUI::ThemeController do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <input type="checkbox" class="theme-controller">
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with value attribute" do
    subject(:output) do
      render described_class.new(value: "dark")
    end

    it "renders with value" do
      expected_html = html <<~HTML
        <input type="checkbox" class="theme-controller" value="dark">
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
        <input type="checkbox" class="theme-controller" data-foo="bar">
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :button) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <button type="checkbox" class="theme-controller"></button>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
