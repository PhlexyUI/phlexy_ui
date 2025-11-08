require "spec_helper"

describe PhlexyUI::ThemeController do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <input type="checkbox" class="theme-controller">
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with theme_value" do
    subject(:output) do
      render described_class.new(theme_value: "dark")
    end

    it "renders with value attribute" do
      expected_html = html <<~HTML
        <input type="checkbox" class="theme-controller" value="dark">
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "with checked" do
    subject(:output) do
      render described_class.new(theme_value: "dark", checked: true)
    end

    it "renders as checked" do
      expected_html = html <<~HTML
        <input type="checkbox" class="theme-controller" value="dark" checked>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "with block for swap pattern" do
    subject(:output) do
      render described_class.new(:swap_rotate, theme_value: "dark") do
        "🌞 🌙"
      end
    end

    it "wraps in label with icons" do
      expected_html = html <<~HTML
        <label class="swap swap-rotate">
          <input type="checkbox" class="theme-controller" value="dark">
          🌞 🌙
        </label>
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
end
