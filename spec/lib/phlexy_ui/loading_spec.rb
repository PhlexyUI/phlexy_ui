require "spec_helper"

describe PhlexyUI::Loading do
  subject(:output) { render described_class.new }

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option as a single argument" do
        subject(:output) do
          render described_class.new(:spinner, responsive: {viewport => :primary})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <span class="loading loading-spinner #{viewport}:text-primary"></span>
          HTML

          expect(output).to eq(expected_html)
        end
      end

      context "when given multiple responsive options as an array" do
        subject(:output) do
          render described_class.new(:spinner, responsive: {viewport => [:primary, :lg]})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <span class="loading loading-spinner #{viewport}:text-primary #{viewport}:loading-lg"></span>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "rendering a full loading" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Loading.new
        end
      end
    end

    subject(:output) do
      render component.new
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <span class="loading"></span>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
