require "spec_helper"

describe PhlexyUI::Alert do
  subject(:output) { render described_class.new }

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
