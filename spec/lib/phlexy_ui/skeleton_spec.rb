require "spec_helper"

describe PhlexyUI::Skeleton do
  subject(:output) { render described_class.new }

  describe "rendering a full skeleton" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Skeleton.new(
            :neutral,
            as: :section,
            data: {
              my: :skeleton
            }
          ) do
            "Skeleton"
          end
        end
      end
    end

    subject(:output) do
      render component.new
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <section class="skeleton" data-my="skeleton">Skeleton</section>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
