require "spec_helper"

describe PhlexyUI::Modal do
  subject(:output) { render described_class.new(id: "test_modal") }

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option as a single argument" do
        subject(:output) do
          render described_class.new(:open, id: "test_modal", responsive: {viewport => :top})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <dialog id="test_modal" class="modal modal-open #{viewport}:modal-top"></dialog>
          HTML

          expect(output).to eq(expected_html)
        end
      end

      context "when given multiple responsive options as an array" do
        subject(:output) do
          render described_class.new(:open, id: "test_modal", responsive: {viewport => [:top, :middle]})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <dialog id="test_modal" class="modal modal-open #{viewport}:modal-top #{viewport}:modal-middle"></dialog>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "rendering a full modal" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Button.new do
            "Open Modal"
          end

          render PhlexyUI::Modal.new(id: "my_modal_1") do |modal|
            modal.body do
              h3 do
                "Hello!"
              end

              p do
                "Press ESC key or click the button below to close"
              end

              modal.action do |action|
                action.close_button :primary do
                  "Close"
                end
              end
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
        <button class="btn">Open Modal</button>
        <dialog id="my_modal_1" class="modal">
          <div class="modal-box">
            <h3>Hello!</h3>
            <p>Press ESC key or click the button below to close</p>
            <div class="modal-action">
              <form method="dialog">
                <button class="btn btn-primary">Close</button>
              </form>
            </div>
          </div>
        </dialog>
      HTML

      is_expected.to eq(expected_html)
    end
  end

  describe "rendering a full modal that closes when clicking the backdrop" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Button.new do
            "Open Modal"
          end

          render PhlexyUI::Modal.new(:tap_outside_to_close, id: "my_modal_1") do |modal|
            modal.body do
              h3 do
                "Hello!"
              end

              p do
                "Press ESC key or click the button below to close"
              end
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
        <button class="btn">Open Modal</button>
        <dialog id="my_modal_1" class="modal">
          <div class="modal-box">
            <h3>Hello!</h3>
            <p>Press ESC key or click the button below to close</p>
          </div>
          <form method="dialog" class="modal-backdrop">
            <button></button>
          </form>
        </dialog>
      HTML

      is_expected.to eq(expected_html)
    end
  end

  describe "rendering a full modal with a button to close on the corner" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Button.new do
            "Open Modal"
          end

          render PhlexyUI::Modal.new(id: "my_modal_1") do |modal|
            modal.body do
              modal.close_button :sm, :circle, :ghost, class: "absolute right-2 top-2" do
                "✕"
              end

              h3 do
                "Hello!"
              end

              p do
                "Press ESC key or click the button below to close"
              end
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
        <button class="btn">Open Modal</button>
        <dialog id="my_modal_1" class="modal">
          <div class="modal-box">
            <form method="dialog">
              <button class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2">✕</button>
            </form>
            <h3>Hello!</h3>
            <p>Press ESC key or click the button below to close</p>
          </div>
        </dialog>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
