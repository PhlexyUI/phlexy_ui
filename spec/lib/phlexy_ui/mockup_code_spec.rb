require "spec_helper"

describe PhlexyUI::MockupCode do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="mockup-code"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "data" do
    subject(:output) do
      render described_class.new(data: {foo: "bar"})
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <div class="mockup-code" data-foo="bar"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :pre) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <pre class="mockup-code"></pre>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
