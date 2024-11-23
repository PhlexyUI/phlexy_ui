require "spec_helper"

describe PhlexyUI::Tabs do
  subject(:output) { render described_class.new }

  describe "conditions" do
    {
      boxed: "tabs-boxed",
      bordered: "tabs-bordered",
      lifted: "tabs-lifted",
      xs: "tabs-xs",
      sm: "tabs-sm",
      md: "tabs-md",
      lg: "tabs-lg"
    }.each do |condition, css|
      context "when given :#{condition} condition on the tabs" do
        subject(:output) { render described_class.new(condition) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <div role="tablist" class="tabs #{css}"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    {
      active: "tab-active",
      disabled: "tab-disabled"
    }.each do |condition, css|
      context "when given :#{condition} condition on a tab" do
        subject(:output) do
          render described_class.new do |tabs|
            tabs.tab(condition)
          end
        end

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <div role="tablist" class="tabs">
              <div role="tab" class="tab #{css}"></div>
            </div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    describe "data" do
      subject(:output) do
        render described_class.new(:boxed, data: {foo: "bar"})
      end

      it "renders it correctly" do
        expected_html = html <<~HTML
          <div role="tablist" class="tabs tabs-boxed" data-foo="bar"></div>
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
        render described_class.new(:boxed)
      end

      it "renders it correctly" do
        expected_html = html <<~HTML
          <div role="tablist" class="foo-tabs foo-tabs-boxed"></div>
        HTML

        expect(output).to eq(expected_html)
      end
    end

    context "when condition doesn't exist" do
      it "raises an error" do
        expect { render described_class.new(:foo) }
          .not_to raise_error
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:boxed, :bordered) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <div role="tablist" class="tabs tabs-boxed tabs-bordered"></div>
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "responsiveness" do
    %i[sm md lg].each do |viewport|
      context "when given an :#{viewport} responsive option as a single argument" do
        subject(:output) do
          render described_class.new(:boxed, responsive: {viewport => :bordered})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div role="tablist" class="tabs tabs-boxed #{viewport}:tabs-bordered">
            </div>
          HTML

          expect(output).to eq(expected_html)
        end
      end

      context "when given multiple responsive options as an array" do
        subject(:output) do
          render described_class.new(:boxed, responsive: {viewport => [:boxed, :bordered]})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div role="tablist" class="
              tabs
              tabs-boxed
              #{viewport}:tabs-boxed
              #{viewport}:tabs-bordered">
            </div>
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
          render described_class.new(:boxed, responsive: {viewport => [:boxed, :bordered]})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <div role="tablist" class="
              foo-tabs
              foo-tabs-boxed
              #{viewport}:foo-tabs-boxed
              #{viewport}:foo-tabs-bordered">
            </div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "rendering via Kit" do
    subject(:output) do
      Tabs(:boxed)
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <div role="tablist" class="tabs tabs-boxed"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :section) }

    it "renders the card as the given tag" do
      expected_html = html <<~HTML
        <section role="tablist" class="tabs"></section>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "conditional attributes" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Tabs.new id: "my_tabs" do |tabs|
            tabs.tab "Tab 1", :closed, open: true do |tab|
              tab.content do
                "Tab content 1"
              end
            end

            tabs.tab "Tab 2", :open, closed: true do |tab|
              tab.content do
                "Tab content 2"
              end
            end

            tabs.tab "Tab 3", :open, closed: false do |tab|
              tab.content do
                "Tab content 3"
              end
            end

            tabs.tab "Tab 4", :closed, open: false do |tab|
              tab.content do
                "Tab content 4"
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
        <div role="tablist" class="tabs">
          <input type="radio" name="my_tabs" class="tab" role="tab" aria-label="Tab 1" closed checked>
          <div role="tabpanel" class="tab-content">Tab content 1</div>

          <input type="radio" name="my_tabs" class="tab" role="tab" aria-label="Tab 2" checked closed>
          <div role="tabpanel" class="tab-content">Tab content 2</div>

          <input type="radio" name="my_tabs" class="tab" role="tab" aria-label="Tab 3" checked>
          <div role="tabpanel" class="tab-content">Tab content 3</div>

          <input type="radio" name="my_tabs" class="tab" role="tab" aria-label="Tab 4" closed>
          <div role="tabpanel" class="tab-content">Tab content 4</div>
        </div>
      HTML

      is_expected.to eq(expected_html)
    end
  end

  describe "rendering full tabs with content" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Tabs.new :lifted, boxed: false, id: "my_tabs_2" do |tabs|
            tabs.tab "Tab 1", :active, :closed, data: {my: :tabs} do |tab|
              tab.content class: "bg-base-100 border-base-300 rounded-box p-6" do
                "Tab content 1"
              end
            end

            tabs.tab "Tab 2", :open, class: "text-primary" do |tab|
              tab.content class: "bg-base-100 border-base-300 rounded-box p-6", data: {my: :contents} do
                "Tab content 2"
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
        <div role="tablist" class="tabs tabs-lifted">
          <input 
            type="radio" 
            name="my_tabs_2" 
            class="tab tab-active" 
            role="tab" 
            aria-label="Tab 1"
            closed
            data-my="tabs">
          <div role="tabpanel" 
               class="tab-content 
                      bg-base-100 
                      border-base-300 
                      rounded-box 
                      p-6">Tab content 1</div>

          <input 
            type="radio" 
            name="my_tabs_2" 
            class="tab text-primary" 
            role="tab" 
            aria-label="Tab 2" checked>
          <div role="tabpanel" 
               class="tab-content 
                      bg-base-100 
                      border-base-300 
                      rounded-box 
                      p-6"
              data-my="contents">Tab content 2</div>
        </div>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
