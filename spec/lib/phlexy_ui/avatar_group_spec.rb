require "spec_helper"

describe PhlexyUI::AvatarGroup do
  subject(:output) { render described_class.new }

  describe "rendering a full avatar group" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::AvatarGroup.new as: :span do |avatar_group|
            avatar_group.avatar :online do
              "JD"
            end
            avatar_group.avatar { "AB" }
          end
        end
      end
    end

    subject(:output) do
      render component.new
    end

    it "is expected to match the formatted HTML" do
      expected_html = html <<~HTML
        <span class="avatar-group">
          <div class="avatar online">JD</div>
          <div class="avatar">AB</div>
        </span>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
