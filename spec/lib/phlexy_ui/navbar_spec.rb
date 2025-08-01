require "spec_helper"

describe PhlexyUI::Navbar do
  subject(:output) { render described_class.new }

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option as a single argument" do
        subject(:output) do
          render described_class.new(:neutral, responsive: {viewport => :primary})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <nav class="navbar bg-neutral text-neutral-content #{viewport}:bg-primary #{viewport}:text-primary-content"></nav>
          HTML

          expect(output).to eq(expected_html)
        end
      end

      context "when given multiple responsive options as an array" do
        subject(:output) do
          render described_class.new(:neutral, responsive: {viewport => [:primary, :info]})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <nav class="navbar bg-neutral text-neutral-content #{viewport}:bg-primary #{viewport}:text-primary-content #{viewport}:bg-info #{viewport}:text-info-content"></nav>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "modifiers" do
    {
      primary: "bg-primary text-primary-content",
      secondary: "bg-secondary text-secondary-content",
      accent: "bg-accent text-accent-content",
      neutral: "bg-neutral text-neutral-content",
      base_100: "bg-base-100 text-base-content",
      base_200: "bg-base-200 text-base-content",
      base_300: "bg-base-300 text-base-content",
      info: "bg-info text-info-content",
      success: "bg-success text-success-content",
      warning: "bg-warning text-warning-content",
      error: "bg-error text-error-content"
    }.each do |condition, css|
      context "when given :#{condition} condition" do
        subject(:output) { render described_class.new(condition) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <nav class="navbar #{css}"></nav>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when condition doesn't exist" do
      it "does not raise an error" do
        expect { render described_class.new(:foo) }
          .not_to raise_error
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:primary, :secondary) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <nav class="navbar bg-primary text-primary-content bg-secondary text-secondary-content"></nav>
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "rendering a full navbar" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Navbar.new do |navbar|
            navbar.start class: "start", data: {my: :start} do
            end

            navbar.center class: "center", data: {my: :center} do
            end

            navbar.end class: "end", data: {my: :end} do
            end
          end
        end
      end
    end

    subject(:output) do
      render component.new
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <nav class="navbar">
          <div class="navbar-start start" data-my="start"></div>
          <div class="navbar-center center" data-my="center"></div>
          <div class="navbar-end end" data-my="end"></div>
        </nav>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
