require "spec_helper"

describe PhlexyUI::Countdown do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <span class="countdown"></span>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with style attribute" do
    subject(:output) do
      render described_class.new(style: "--value:15;")
    end

    it "renders with style" do
      expected_html = html <<~HTML
        <span class="countdown" style="--value:15;"></span>
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
        <span class="countdown" data-foo="bar"></span>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :div) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <div class="countdown"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
