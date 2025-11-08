require "spec_helper"

describe PhlexyUI::Stat do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="stats"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with part methods" do
    subject(:output) do
      render described_class.new do |s|
        s.item do
          s.title { "Title" }
          s.value { "Value" }
          s.desc { "Description" }
          s.figure { "Figure" }
          s.actions { "Actions" }
        end
      end
    end

    it "renders all parts" do
      expected_html = html <<~HTML
        <div class="stats">
          <div class="stat">
            <div class="stat-title">Title</div>
            <div class="stat-value">Value</div>
            <div class="stat-desc">Description</div>
            <div class="stat-figure">Figure</div>
            <div class="stat-actions">Actions</div>
          </div>
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "conditions" do
    {
      horizontal: "stats-horizontal",
      vertical: "stats-vertical"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <div class="stats #{css}"></div>
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
        <div class="stats" data-foo="bar"></div>
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
            <div class="stats stats-horizontal #{viewport}:stats-vertical"></div>
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
        <section class="stats"></section>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
