require "spec_helper"

describe PhlexyUI::Fab do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="fab"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with part methods" do
    subject(:output) do
      render described_class.new do |f|
        f.close { "Close" }
        f.main_action { "Action" }
      end
    end

    it "renders all parts" do
      expected_html = html <<~HTML
        <div class="fab">
          <div class="fab-close">Close</div>
          <div class="fab-main-action">Action</div>
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "conditions" do
    {
      flower: "fab-flower"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <div class="fab #{css}"></div>
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
        <div class="fab" data-foo="bar"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option" do
        subject(:output) do
          render described_class.new(:flower, responsive: {viewport => :flower})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div class="fab fab-flower #{viewport}:fab-flower"></div>
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
        <section class="fab"></section>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
