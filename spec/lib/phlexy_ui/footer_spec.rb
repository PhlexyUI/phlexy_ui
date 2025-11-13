require "spec_helper"

describe PhlexyUI::Footer do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <footer class="footer"></footer>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with title method" do
    subject(:output) do
      render described_class.new do |f|
        f.title { "Title" }
      end
    end

    it "renders title" do
      expected_html = html <<~HTML
        <footer class="footer">
          <div class="footer-title">Title</div>
        </footer>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "conditions" do
    {
      center: "footer-center",
      horizontal: "footer-horizontal",
      vertical: "footer-vertical"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <footer class="footer #{css}"></footer>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:center, :horizontal) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <footer class="footer footer-center footer-horizontal"></footer>
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
        <footer class="footer" data-foo="bar"></footer>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option" do
        subject(:output) do
          render described_class.new(:horizontal, responsive: {viewport => :vertical})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <footer class="footer footer-horizontal #{viewport}:footer-vertical"></footer>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :div) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <div class="footer"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
