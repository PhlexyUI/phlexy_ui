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

  describe "conditions" do
    {
      col_wrap: "list-col-wrap",
      col_grow: "list-col-grow"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <ul class="list #{css}"></ul>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:col_wrap, :col_grow) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <ul class="list list-col-wrap list-col-grow"></ul>
        HTML

        expect(output).to eq(expected_html)
      end
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

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option" do
        subject(:output) do
          render described_class.new(:col_wrap, responsive: {viewport => :col_grow})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <ul class="list list-col-wrap #{viewport}:list-col-grow"></ul>
          HTML

          expect(output).to eq(expected_html)
        end
      end
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
