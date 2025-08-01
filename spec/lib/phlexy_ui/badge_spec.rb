require "spec_helper"

describe PhlexyUI::Badge do
  subject(:output) { render described_class.new }

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option as a single argument" do
        subject(:output) do
          render described_class.new(:neutral, responsive: {viewport => :primary})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <span class="badge badge-neutral #{viewport}:badge-primary"></span>
          HTML

          expect(output).to eq(expected_html)
        end
      end

      context "when given multiple responsive options as an array" do
        subject(:output) do
          render described_class.new(:neutral, responsive: {viewport => [:primary, :lg]})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <span class="badge badge-neutral #{viewport}:badge-primary #{viewport}:badge-lg"></span>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "rendering a full badge" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Badge.new(:neutral, primary: false, secondary: true) do
            div do
              "+"
            end

            plain "Badge"
          end
        end
      end
    end

    subject(:output) do
      render component.new
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <span class="badge badge-neutral badge-secondary"><div>+</div>Badge</span>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
