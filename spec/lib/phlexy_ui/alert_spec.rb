require "spec_helper"

describe PhlexyUI::Alert do
  subject(:output) { render described_class.new }

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option as a single argument" do
        subject(:output) do
          render described_class.new(:neutral, responsive: {viewport => :primary})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div role="alert" class="alert alert-neutral #{viewport}:alert-primary"></div>
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
            <div role="alert" class="alert alert-neutral #{viewport}:alert-primary #{viewport}:alert-info"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "rendering a full alert" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Alert.new(
            :neutral,
            primary: false,
            secondary: true,
            as: :div,
            data: {
              my: :alert
            }
          ) do
            "Alert"
          end
        end
      end
    end

    subject(:output) do
      render component.new
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <div role="alert" class="alert alert-neutral alert-secondary" data-my="alert">Alert</div>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
