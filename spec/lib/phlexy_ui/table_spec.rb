require "spec_helper"

describe PhlexyUI::Table do
  subject(:output) { render described_class.new }

  describe "modifiers" do
    {
      zebra: "table-zebra",
      pin_rows: "table-pin-rows",
      pin_cols: "table-pin-cols",
      xs: "table-xs",
      sm: "table-sm",
      md: "table-md",
      lg: "table-lg"
    }.each do |condition, css|
      context "when given :#{condition} condition" do
        subject(:output) { render described_class.new(condition) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <table class="table #{css}"></table>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when condition doesn't exist" do
      it "does not raise an error" do
        expect { render described_class.new(:foo) }
          .not_to raise_error
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:zebra, :pin_rows) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <table class="table table-zebra table-pin-rows"></table>
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "data" do
    subject(:output) do
      render described_class.new(:zebra, data: {foo: "bar"})
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <table class="table table-zebra" data-foo="bar"></table>
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
      render described_class.new(:zebra)
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <table class="foo-table foo-table-zebra"></table>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "custom modifiers" do
    context "when there's a custom modifier for the component" do
      around do |example|
        PhlexyUI.configure do |config|
          config.modifiers.add(
            :my_modifier,
            component: PhlexyUI::Table,
            classes: "w-96 shadow-xl"
          )
        end

        example.run

        PhlexyUI.configure do |config|
          config.modifiers.remove(:my_modifier, component: PhlexyUI::Table)
        end
      end

      subject(:output) do
        render described_class.new(:my_modifier)
      end

      it "renders it correctly" do
        expected_html = html <<~HTML
          <table class="table w-96 shadow-xl"></table>
        HTML

        expect(output).to eq(expected_html)
      end
    end

    context "when there's a custom modifier without a specific component" do
      around do |example|
        PhlexyUI.configure do |config|
          config.modifiers.add(
            :my_modifier,
            classes: "w-96 shadow-xl"
          )
        end

        example.run

        PhlexyUI.configure do |config|
          config.modifiers.remove(:my_modifier)
        end
      end

      subject(:output) do
        render described_class.new(:my_modifier)
      end

      it "renders it correctly" do
        expected_html = html <<~HTML
          <table class="table w-96 shadow-xl"></table>
        HTML

        expect(output).to eq(expected_html)
      end
    end

    context "when there's no custom modifier" do
      subject(:output) do
        render described_class.new(:my_modifier)
      end

      it "does not render it" do
        expected_html = html <<~HTML
          <table class="table"></table>
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "responsiveness" do
    %i[sm md lg xl @sm @md @lg @xl].each do |viewport|
      context "when given an :#{viewport} responsive option as a single argument" do
        subject(:output) do
          render described_class.new(:zebra, responsive: {viewport => :pin_cols})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <table class="
              table 
              table-zebra 
              #{viewport}:table-pin-cols">
            </table>
          HTML

          expect(output).to eq(expected_html)
        end
      end

      context "when given multiple responsive options as an array" do
        subject(:output) do
          render described_class.new(:zebra, responsive: {viewport => [:pin_cols, :xs]})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <table class="
              table 
              table-zebra 
              #{viewport}:table-pin-cols 
              #{viewport}:table-xs">
            </table>
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
          render described_class.new(:zebra, responsive: {viewport => [:pin_cols, :xs]})
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <table class="
              foo-table 
              foo-table-zebra
              #{viewport}:foo-table-pin-cols
              #{viewport}:foo-table-xs">
            </table>
          HTML

          expect(output).to eq(expected_html)
        end
      end

      context "when there are custom modifiers" do
        around do |example|
          PhlexyUI.configure do |config|
            config.modifiers.add(
              :my_modifier,
              component: PhlexyUI::Table,
              classes: "w-96 shadow-xl"
            )

            config.modifiers.add(
              :my_other_modifier,
              classes: "p-4 rounded-box"
            )
          end

          example.run

          PhlexyUI.configure do |config|
            config.modifiers.remove(:my_modifier, component: PhlexyUI::Table)
            config.modifiers.remove(:my_other_modifier)
          end
        end

        subject(:output) do
          render described_class.new(
            :my_modifier,
            responsive: {viewport => :my_other_modifier}
          )
        end

        it "renders it separately with a responsive prefix" do
          expected_html = html <<~HTML
            <table class="
              table
              w-96
              shadow-xl
              #{viewport}:p-4
              #{viewport}:rounded-box">
            </table>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "rendering via Kit" do
    subject(:output) do
      Table(:zebra)
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <table class="table table-zebra"></table>
      HTML
      expect(output).to eq(expected_html)
    end
  end

  describe "conditional modifiers" do
    subject(:output) do
      render PhlexyUI::Table.new(
        :zebra,
        xs: false,
        sm: true,
        pin_cols: true,
        responsive: {sm: :pin_cols}
      )
    end

    it "renders it correctly" do
      expected_html = html <<~HTML
        <table 
          class="table table-zebra table-pin-cols table-sm sm:table-pin-cols">
        </table>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "rendering a full table" do
    let(:component) do
      Class.new(Phlex::HTML) do
        def view_template(&)
          render PhlexyUI::Table.new(:zebra, xs: false, sm: true, pin_cols: true) do |table|
            table.header do |header|
              header.row do |row|
                row.head { "" }
                row.head class: "my-head", data: {my: "heads"} do
                  "Name"
                end
                row.head { "Job" }
                row.head { "Favorite Color" }
              end
            end

            table.body do |body|
              body.row :base_200, :hover do |row|
                row.head { "1" }
                row.cell class: "my-cell", data: {my: "cells"} do
                  "Ada Lovelace"
                end
                row.column class: "my-column", data: {my: "columns"} do
                  "Engineer"
                end
                row.cell { "Indigo" }
              end
            end

            table.footer do |footer|
              footer.row do |row|
                row.head { "" }
                row.head class: "my-head", data: {my: "heads"} do
                  "Name"
                end
                row.head { "Job" }
                row.head { "Favorite Color" }
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
        <table class="table table-zebra table-pin-cols table-sm">
          <thead>
            <tr>
              <th></th>
              <th class="my-head" data-my="heads">Name</th>
              <th>Job</th>
              <th>Favorite Color</th>
            </tr>
          </thead>
          <tbody>
            <tr class="bg-base-200 text-base-content hover">
              <th>1</th>
              <td class="my-cell" data-my="cells">Ada Lovelace</td>
              <td class="my-column" data-my="columns">Engineer</td>
              <td>Indigo</td>
            </tr>
          </tbody>
          <tfoot>
            <tr>
              <th></th>
              <th class="my-head" data-my="heads">Name</th>
              <th>Job</th>
              <th>Favorite Color</th>
            </tr>
          </tfoot>
        </table>
      HTML

      is_expected.to eq(expected_html)
    end
  end
end
