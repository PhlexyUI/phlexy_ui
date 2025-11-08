require "spec_helper"

describe PhlexyUI::Fieldset do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <fieldset class="fieldset"></fieldset>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with legend method" do
    subject(:output) do
      render described_class.new do |f|
        f.legend { "Legend" }
      end
    end

    it "renders legend" do
      expected_html = html <<~HTML
        <fieldset class="fieldset">
          <legend class="fieldset-legend">Legend</legend>
        </fieldset>
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
        <fieldset class="fieldset" data-foo="bar"></fieldset>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :div) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <div class="fieldset"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
