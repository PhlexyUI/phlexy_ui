require "spec_helper"

describe PhlexyUI::Toast do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="toast"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "conditions" do
    {
      start: "toast-start",
      center: "toast-center",
      end: "toast-end",
      top: "toast-top",
      middle: "toast-middle",
      bottom: "toast-bottom"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <div class="toast #{css}"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:top, :end) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <div class="toast toast-top toast-end"></div>
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
        <div class="toast" data-foo="bar"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option" do
        subject(:output) do
          render described_class.new(:top, responsive: {viewport => :bottom})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div class="toast toast-top #{viewport}:toast-bottom"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :aside) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <aside class="toast"></aside>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
