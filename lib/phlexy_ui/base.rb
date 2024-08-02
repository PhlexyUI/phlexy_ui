# frozen_string_literal: true

module PhlexyUI
  class Base < Phlex::HTML
    def initialize(*normal_conditions, sm: [], md: [], lg: [], **options)
      @normal_conditions = normal_conditions
      @sm_conditions = Array(sm)
      @md_conditions = Array(md)
      @lg_conditions = Array(lg)
      @options = options
      @data = options.delete(:data)
    end

    private

    attr_reader :normal_conditions,
      :sm_conditions,
      :md_conditions,
      :lg_conditions,
      :options,
      :data,
      :as

    def classes
      [
        prefixed(self.class::BASE_HTML_CLASS),
        *html_classes_for_conditions(normal_conditions),
        *html_classes_for_conditions(sm_conditions, responsive_prefix: :sm),
        *html_classes_for_conditions(md_conditions, responsive_prefix: :md),
        *html_classes_for_conditions(lg_conditions, responsive_prefix: :lg)
      ]
    end

    def html_classes_for_conditions(conditions, responsive_prefix: nil)
      conditions.map do |condition|
        class_name = prefixed self.class::CONDITIONS_CLASSES.fetch(condition)

        responsive_prefix ? "#{responsive_prefix}:#{class_name}" : class_name
      end
    rescue KeyError => e
      raise ArgumentError, "Condition `#{e.key}` is not defined for #{self.class}"
    end

    def prefixed(string)
      "#{PhlexyUI.configuration.prefix}#{string}"
    end
  end
end
