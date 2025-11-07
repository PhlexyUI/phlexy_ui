require "spec_helper"

describe PhlexyUI::Rating do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="rating"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "conditions" do
    {
      half: "rating-half",
      hidden: "rating-hidden",
      xs: "rating-xs",
      sm: "rating-sm",
      md: "rating-md",
      lg: "rating-lg",
      xl: "rating-xl"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <div class="rating #{css}"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:half, :lg) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <div class="rating rating-half rating-lg"></div>
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
        <div class="rating" data-foo="bar"></div>
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
            <div class="rating rating-sm #{viewport}:rating-lg"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :span) }

    it "renders as the given tag" do
      expected_html = html <<~HTML
        <span class="rating"></span>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
