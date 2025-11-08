require "spec_helper"

describe PhlexyUI::List do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <ul class="list"></ul>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with row method" do
    subject(:output) do
      render described_class.new do |l|
        l.row { "Row 1" }
        l.row { "Row 2" }
      end
    end

    it "renders rows" do
      expected_html = html <<~HTML
        <ul class="list">
          <li class="list-row">Row 1</li>
          <li class="list-row">Row 2</li>
        </ul>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "with col_wrap method" do
    subject(:output) do
      render described_class.new do |l|
        l.row do
          l.col_wrap { "Wrapping content" }
        end
      end
    end

    it "renders col_wrap inside row" do
      expected_html = html <<~HTML
        <ul class="list">
          <li class="list-row">
            <div class="list-col-wrap">Wrapping content</div>
          </li>
        </ul>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "with col_grow method" do
    subject(:output) do
      render described_class.new do |l|
        l.row do
          l.col_grow { "Growing content" }
        end
      end
    end

    it "renders col_grow inside row" do
      expected_html = html <<~HTML
        <ul class="list">
          <li class="list-row">
            <div class="list-col-grow">Growing content</div>
          </li>
        </ul>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "with col_grow custom element" do
    subject(:output) do
      render described_class.new do |l|
        l.row do
          l.col_grow(as: :span) { "Growing content" }
        end
      end
    end

    it "renders col_grow as specified element" do
      expected_html = html <<~HTML
        <ul class="list">
          <li class="list-row">
            <span class="list-col-grow">Growing content</span>
          </li>
        </ul>
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
        <ul class="list" data-foo="bar"></ul>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "with both col_wrap and col_grow in same row" do
    subject(:output) do
      render described_class.new do |l|
        l.row do
          l.col_grow { "Growing content" }
          l.col_wrap { "Wrapping content" }
        end
      end
    end

    it "renders both column types in one row" do
      expected_html = html <<~HTML
        <ul class="list">
          <li class="list-row">
            <div class="list-col-grow">Growing content</div>
            <div class="list-col-wrap">Wrapping content</div>
          </li>
        </ul>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :ol) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <ol class="list"></ol>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
