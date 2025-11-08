require "spec_helper"

describe PhlexyUI::Dock do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="dock"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with label method" do
    subject(:output) do
      render described_class.new do |d|
        d.label { "Label" }
      end
    end

    it "renders label" do
      expected_html = html <<~HTML
        <div class="dock">
          <span class="dock-label">Label</span>
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "conditions" do
    {
      active: "dock-active",
      xs: "dock-xs",
      sm: "dock-sm",
      md: "dock-md",
      lg: "dock-lg",
      xl: "dock-xl"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <div class="dock #{css}"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:active, :lg) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <div class="dock dock-active dock-lg"></div>
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
        <div class="dock" data-foo="bar"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option" do
        subject(:output) do
          render described_class.new(:sm, responsive: {viewport => :lg})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div class="dock dock-sm #{viewport}:dock-lg"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :section) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <section class="dock"></section>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
