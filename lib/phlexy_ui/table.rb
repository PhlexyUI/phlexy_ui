# frozen_string_literal: true

module PhlexyUI
  class Table < Base
    def view_template(&)
      generate_classes!(
        component_html_class: :table,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        table(class: classes, **options, &)
      end
    end

    def header(*, **, &)
      thead(*, **, &)
    end

    def row(*, **, &)
      render TableRow.new(*, **, &)
    end

    def body(*, **, &)
      tbody(*, **, &)
    end

    def footer(*, **, &)
      tfoot(*, **, &)
    end

    private

    register_modifiers(
      # "sm:table-zebra"
      # "@sm:table-zebra"
      # "md:table-zebra"
      # "@md:table-zebra"
      # "lg:table-zebra"
      # "@lg:table-zebra"
      zebra: "table-zebra",
      # "sm:table-pin-rows"
      # "@sm:table-pin-rows"
      # "md:table-pin-rows"
      # "@md:table-pin-rows"
      # "lg:table-pin-rows"
      # "@lg:table-pin-rows"
      pin_rows: "table-pin-rows",
      # "sm:table-pin-cols"
      # "@sm:table-pin-cols"
      # "md:table-pin-cols"
      # "@md:table-pin-cols"
      # "lg:table-pin-cols"
      # "@lg:table-pin-cols"
      pin_cols: "table-pin-cols",
      # "sm:table-xs"
      # "@sm:table-xs"
      # "md:table-xs"
      # "@md:table-xs"
      # "lg:table-xs"
      # "@lg:table-xs"
      xs: "table-xs",
      # "sm:table-sm"
      # "@sm:table-sm"
      # "md:table-sm"
      # "@md:table-sm"
      # "lg:table-sm"
      # "@lg:table-sm"
      sm: "table-sm",
      # "sm:table-md"
      # "@sm:table-md"
      # "md:table-md"
      # "@md:table-md"
      # "lg:table-md"
      # "@lg:table-md"
      md: "table-md",
      # "sm:table-lg"
      # "@sm:table-lg"
      # "md:table-lg"
      # "@md:table-lg"
      # "lg:table-lg"
      # "@lg:table-lg"
      lg: "table-lg"
    )
  end
end
