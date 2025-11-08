require "spec_helper"

describe PhlexyUI::Pagination do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="join"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with item method" do
    subject(:output) do
      render described_class.new do |p|
        p.item { "1" }
        p.item { "2" }
        p.item { "3" }
      end
    end

    it "renders items" do
      expected_html = html <<~HTML
        <div class="join">
          <div class="join-item">1</div>
          <div class="join-item">2</div>
          <div class="join-item">3</div>
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "conditions" do
    {
      vertical: "join-vertical",
      horizontal: "join-horizontal"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <div class="join #{css}"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "data" do
    subject(:output) do
      render described_class.new(data: {foo: "bar"})
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <div class="join" data-foo="bar"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option" do
        subject(:output) do
          render described_class.new(:vertical, responsive: {viewport => :horizontal})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div class="join join-vertical #{viewport}:join-horizontal"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :nav) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <nav class="join"></nav>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
