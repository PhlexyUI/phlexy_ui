require "spec_helper"

describe PhlexyUI::Navbar do
  subject(:output) { render described_class.new }

  describe "rendering a full navbar" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Navbar.new do |navbar|
            navbar.start do
            end

            navbar.center do
            end

            navbar.end do
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
          <div class="navbar-start"></div>
          <div class="navbar-center"></div>
          <div class="navbar-end"></div>
        </nav>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
