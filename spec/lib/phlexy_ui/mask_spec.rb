require "spec_helper"

describe PhlexyUI::Mask do
  subject(:output) { render described_class.new }

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option as a single argument" do
        subject(:output) do
          render described_class.new(:squircle, responsive: {viewport => :heart})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div class="mask mask-squircle #{viewport}:mask-heart"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end

      context "when given multiple responsive options as an array" do
        subject(:output) do
          render described_class.new(:squircle, responsive: {viewport => [:heart, :circle]})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div class="mask mask-squircle #{viewport}:mask-heart #{viewport}:mask-circle"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "rendering a full mask" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Mask.new(:squircle, heart: false, hexagon: true) do
          end
        end
      end
    end

    subject(:output) do
      render component.new
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <div class="mask mask-squircle mask-hexagon"></div>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
