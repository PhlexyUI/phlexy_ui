require "spec_helper"

describe PhlexyUI::Avatar do
  subject(:output) { render described_class.new }

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option as a single argument" do
        subject(:output) do
          render described_class.new(:online, responsive: {viewport => :placeholder})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div class="avatar online #{viewport}:placeholder"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end

      context "when given multiple responsive options as an array" do
        subject(:output) do
          render described_class.new(:online, responsive: {viewport => [:placeholder, :offline]})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div class="avatar online #{viewport}:placeholder #{viewport}:offline"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "rendering a full avatar" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Avatar.new(:online, offline: false, placeholder: true) do
            div class: "w-24 rounded" do
              img src: "some-image.jpg"
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
        <div class="avatar online placeholder">
          <div class="w-24 rounded">
            <img src="some-image.jpg">
          </div>
        </div>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
