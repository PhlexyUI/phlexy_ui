require "spec_helper"

describe PhlexyUI::Swap do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <label class="swap"></label>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with part methods" do
    subject(:output) do
      render described_class.new do |s|
        s.on { "On" }
        s.off { "Off" }
        s.indeterminate { "Indeterminate" }
      end
    end

    it "renders all parts" do
      expected_html = html <<~HTML
        <label class="swap">
          <div class="swap-on">On</div>
          <div class="swap-off">Off</div>
          <div class="swap-indeterminate">Indeterminate</div>
        </label>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "conditions" do
    {
      active: "swap-active",
      rotate: "swap-rotate",
      flip: "swap-flip"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <label class="swap #{css}"></label>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:active, :rotate) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <label class="swap swap-active swap-rotate"></label>
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
        <label class="swap" data-foo="bar"></label>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option" do
        subject(:output) do
          render described_class.new(:rotate, responsive: {viewport => :flip})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <label class="swap swap-rotate #{viewport}:swap-flip"></label>
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
        <div class="swap"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
