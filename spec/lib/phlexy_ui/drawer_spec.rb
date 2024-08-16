require "spec_helper"

describe PhlexyUI::Drawer do
  subject(:output) { render described_class.new }

  describe "conditions" do
    {
      end: "drawer-end",
      open: "drawer-open"
    }.each do |condition, css|
      context "when given :#{condition} condition" do
        subject(:output) { render described_class.new(condition, id: :my_drawer) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <section class="drawer #{css}"></section>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when condition doesn't exist" do
      it "raises an error" do
        expect { render described_class.new(:foo, id: :my_drawer) }
          .not_to raise_error
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:end, :open, id: :my_drawer) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <section class="drawer drawer-end drawer-open"></section>
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "data" do
    subject(:output) do
      render described_class.new(:open, id: :my_drawer, data: {foo: "bar"})
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <section class="drawer drawer-open" data-foo="bar"></section>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "prefix" do
    around do |example|
      original_prefix = PhlexyUI.configuration.prefix

      PhlexyUI.configure do |config|
        config.prefix = "foo-"
      end

      example.run

      PhlexyUI.configure do |config|
        config.prefix = original_prefix
      end
    end

    subject(:output) do
      render described_class.new(:open, id: :my_drawer)
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <section class="foo-drawer foo-drawer-open"></section>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "responsiveness" do
    %i[sm md lg].each do |viewport|
      context "when given an :#{viewport} responsive option as a single argument" do
        subject(:output) do
          render described_class.new(:open, viewport => :end, :id => :my_drawer)
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <section class="drawer drawer-open #{viewport}:drawer-end">
            </section>
          HTML

          expect(output).to eq(expected_html)
        end
      end

      context "when given multiple responsive options as an array" do
        subject(:output) do
          render described_class.new(:open, viewport => [:open, :end], :id => :my_drawer)
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <section class="
              drawer 
              drawer-open 
              #{viewport}:drawer-open 
              #{viewport}:drawer-end">
            </section>
          HTML

          expect(output).to eq(expected_html)
        end
      end

      context "when it's prefixed" do
        around do |example|
          original_prefix = PhlexyUI.configuration.prefix

          PhlexyUI.configure do |config|
            config.prefix = "foo-"
          end

          example.run

          PhlexyUI.configure do |config|
            config.prefix = original_prefix
          end
        end

        subject(:output) do
          render described_class.new(:open, viewport => [:open, :end], :id => :my_drawer)
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <section class="
              foo-drawer 
              foo-drawer-open 
              #{viewport}:foo-drawer-open 
              #{viewport}:foo-drawer-end">
            </section>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "rendering via Kit" do
    subject(:output) do
      Drawer(:end, id: :my_drawer)
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <section class="drawer drawer-end"></section>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :div, id: :my_drawer) }

    it "renders the card as the given tag" do
      expected_html = html <<~HTML
        <div class="drawer"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "rendering a full drawer" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Drawer.new(:end, id: :my_drawer) do |drawer|
            drawer.toggle(class: "my-toggle", data: {my: "toggles"})
            drawer.content(class: "my-content", data: {my: "contents"}) do
              drawer.button(:primary, class: "my-button", data: {my: "buttons"}) do
                "Open Drawer"
              end

              div do
                "Content"
              end
            end
            drawer.side(class: "my-side", data: {my: "sides"}) do |side|
              side.overlay

              ul do
                li do
                  a do
                    "Sidebar Item 1"
                  end
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
        <section class="drawer drawer-end">
          <input id="my_drawer" type="checkbox" class="drawer-toggle my-toggle" data-my="toggles">
          <div class="drawer-content my-content" data-my="contents">
            <label class="btn btn-primary my-button" for="my_drawer" data-my="buttons">Open Drawer</label>
            <div>Content</div>
          </div>
          <div class="drawer-side my-side" data-my="sides">
            <label for="my_drawer" class="drawer-overlay"></label>

            <ul>
              <li>
                <a>Sidebar Item 1</a>
              </li>
            </ul>
          </div>
        </section>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
