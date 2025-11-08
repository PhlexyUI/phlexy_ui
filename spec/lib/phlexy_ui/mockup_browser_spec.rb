require "spec_helper"

describe PhlexyUI::MockupBrowser do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="mockup-browser"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with toolbar method" do
    subject(:output) do
      render described_class.new do |m|
        m.toolbar { "Toolbar" }
      end
    end

    it "renders toolbar" do
      expected_html = html <<~HTML
        <div class="mockup-browser">
          <div class="mockup-browser-toolbar">Toolbar</div>
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
        <div class="mockup-browser" data-foo="bar"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :section) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <section class="mockup-browser"></section>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
