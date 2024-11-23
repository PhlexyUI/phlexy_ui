require "spec_helper"

describe PhlexyUI::Menu do
  subject(:output) { render described_class.new }

  describe "conditions" do
    {
      xs: "menu-xs",
      sm: "menu-sm",
      md: "menu-md",
      lg: "menu-lg",
      vertical: "menu-vertical",
      horizontal: "menu-horizontal",
      base_100: "bg-base-100 text-base-content",
      base_200: "bg-base-200 text-base-content",
      base_300: "bg-base-300 text-base-content",
      info: "bg-info text-info-content",
      success: "bg-success text-success-content",
      warning: "bg-warning text-warning-content",
      error: "bg-error text-error-content"
    }.each do |condition, class_name|
      context "when given :#{condition} condition" do
        subject(:output) { render described_class.new(condition) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <ul class="menu #{class_name}"></ul>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    {
      disabled: "disabled",
      active: "active",
      focus: "focus"
    }.each do |condition, css|
      context "when given :#{condition} condition on an item" do
        subject(:output) do
          render described_class.new do |menu|
            menu.item(condition)
          end
        end

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <ul class="menu">
              <li class="#{css}"></li>
            </ul>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when condition doesn't exist" do
      it "raises an error" do
        expect { render described_class.new(:foo) }
          .not_to raise_error
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:vertical, :xs) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <ul class="menu menu-vertical menu-xs"></ul>
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "data" do
    subject(:output) do
      render described_class.new(:xs, data: {foo: "bar"})
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <ul class="menu menu-xs" data-foo="bar"></ul>
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
      render described_class.new(:xs)
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <ul class="foo-menu foo-menu-xs"></ul>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "responsiveness" do
    %i[sm md lg].each do |viewport|
      context "when given an :#{viewport} responsive option as a single argument" do
        subject(:output) do
          render described_class.new(:xs, responsive: {viewport => :vertical})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <ul class="menu menu-xs #{viewport}:menu-vertical">
            </ul>
          HTML

          expect(output).to eq(expected_html)
        end
      end

      context "when given multiple responsive options as an array" do
        subject(:output) do
          render described_class.new(:xs, responsive: {viewport => [:horizontal, :vertical]})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <ul class="
              menu 
              menu-xs 
              #{viewport}:menu-horizontal 
              #{viewport}:menu-vertical">
            </ul>
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
          render described_class.new(:xs, responsive: {viewport => [:horizontal, :vertical]})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <ul class="
              foo-menu 
              foo-menu-xs 
              #{viewport}:foo-menu-horizontal 
              #{viewport}:foo-menu-vertical">
            </ul>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "rendering via Kit" do
    subject(:output) do
      Menu(:xs)
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <ul class="menu menu-xs"></ul>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "title with custom class" do
    subject(:output) do
      render described_class.new do |menu|
        menu.title(class: "text-lg")
      end
    end

    it "renders it with the custom class" do
      expected_html = html <<~HTML
        <ul class="menu">
          <li class="menu-title text-lg"></li>
        </ul>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "conditional modifiers" do
    subject(:output) do
      render described_class.new(xs: true, sm: false) do |menu|
        menu.title { "My Menu" }
      end
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <ul class="menu menu-xs">
          <li class="menu-title">My Menu</li>
        </ul>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "conditional attributes on collapsible submenu" do
    subject(:output) do
      render described_class.new do |menu|
        menu.submenu(:collapsible, open: true) do |submenu|
          submenu.title { "My Submenu" }
        end
      end
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <ul class="menu">
          <li>
            <details open>
              <summary>My Submenu</summary>
            </details>
          </li>
        </ul>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "rendering a full menu" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Menu.new(class: "bg-base-200 w-52") do |menu|
            menu.title do
              "My Menu"
            end

            menu.item :disabled do
              a do
                "Item 1"
              end
            end

            menu.item do |item|
              item.submenu :collapsible, :open, :primary, class: "rounded-t-none", data: {my: :collapsible_menus} do |submenu|
                submenu.title do
                  "Parent 1"
                end

                submenu.item do |submenu_item|
                  a do
                    "Child 1"
                  end
                end

                submenu.item do |submenu_item|
                  submenu_item.submenu :collapsible do |submenu_2|
                    submenu_2.title do
                      "Parent 2"
                    end

                    submenu_2.item do
                      a do
                        "Child 2"
                      end
                    end
                  end
                end

                submenu.item do |submenu_item|
                  submenu_item.submenu do |submenu_2|
                    submenu_2.title do
                      "Parent 3"
                    end

                    submenu_2.item do
                      a do
                        "Child 3"
                      end
                    end
                  end
                end
              end
            end

            menu.item do |item|
              item.submenu do |submenu|
                submenu.title do
                  "Parent 1"
                end

                submenu.item do
                  a do
                    "Child 1"
                  end
                end

                submenu.item do |item|
                  item.submenu do |submenu_2|
                    submenu_2.title do
                      "Parent 2"
                    end

                    submenu_2.item do
                      a do
                        "Child 2"
                      end
                    end
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
        <ul class="menu bg-base-200 w-52">
          <li class="menu-title">My Menu</li>
          <li class="disabled"><a>Item 1</a></li>
          <li>
            <details open>
              <summary>Parent 1</summary>
              <ul class="bg-primary text-primary-content rounded-t-none" data-my="collapsible_menus">
                <li><a>Child 1</a></li>
                <li>
                  <details>
                    <summary>Parent 2</summary>
                    <ul>
                      <li><a>Child 2</a></li>
                    </ul>
                  </details>
                </li>
                <li>
                  <div>Parent 3</div>
                  <ul>
                    <li><a>Child 3</a></li>
                  </ul>
                </li>
              </ul>
            </details>
          </li>
          <li>
            <div>Parent 1</div>
            <ul>
              <li><a>Child 1</a></li>
              <li>
                <div>Parent 2</div>
                <ul>
                  <li><a>Child 2</a></li>
                </ul>
              </li>
            </ul>
          </li>
        </ul>
      HTML

      is_expected.to eq(expected_html)
    end
  end

  describe "rendering a components sidebar" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Menu do |menu|
            menu.item do |item|
              item.submenu :collapsible, :open do |submenu|
                submenu.title { "Docs" }

                submenu.item do
                  a href: "/docs/installation" do
                    "Installation"
                  end
                end
              end
            end

            menu.item do |item|
              item.submenu :collapsible, :open do |submenu|
                submenu.title { "Components" }

                [
                  {
                    name: "Actions",
                    components: [
                      "Button",
                      "Dropdown"
                    ]
                  },
                  {
                    name: "Data display",
                    components: [
                      "Badge",
                      "Card"
                    ]
                  }
                ].each do |category|
                  submenu.item do |item|
                    item.title class: "px-1.5" do
                      category[:name]
                    end

                    item.submenu do |submenu|
                      category[:components].each do |component|
                        submenu.item do
                          a href: "/components/#{component.downcase}" do
                            component
                          end
                        end
                      end
                    end
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
        <ul class="menu">
          <li>
            <details open>
              <summary>Docs</summary>
              <ul>
                <li><a href="/docs/installation">Installation</a></li>
              </ul>
            </details>
          </li>
          <li>
            <details open>
              <summary>Components</summary>
              <ul>
                <li>
                  <h2 class="menu-title px-1.5">Actions</h2>
                  <ul>
                    <li><a href="/components/button">Button</a></li>
                    <li><a href="/components/dropdown">Dropdown</a></li>
                  </ul>
                </li>
                <li>
                  <h2 class="menu-title px-1.5">Data display</h2>
                  <ul>
                    <li><a href="/components/badge">Badge</a></li>
                    <li><a href="/components/card">Card</a></li>
                  </ul>
                </li>
              </ul>
            </details>
          </li>
        </ul>
        
      HTML

      is_expected.to eq(expected_html)
    end
  end

  describe "rendering with title as parent" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Menu.new :base_200, class: "rounded-box w-56" do |menu|
            menu.item do |item|
              item.title do
                "Title"
              end

              item.submenu do |submenu|
                submenu.item do
                  a do
                    "Item 1"
                  end
                end

                submenu.item do
                  a do
                    "Item 2"
                  end
                end

                submenu.item do
                  a do
                    "Item 3"
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
        <ul class="menu bg-base-200 text-base-content rounded-box w-56">
          <li>
            <h2 class="menu-title">Title</h2>
            <ul>
              <li><a>Item 1</a></li>
              <li><a>Item 2</a></li>
              <li><a>Item 3</a></li>
            </ul>
          </li>
        </ul>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
