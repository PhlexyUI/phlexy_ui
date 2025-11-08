# frozen_string_literal: true

module PhlexyUI
  # @component html class="stats"
  class Stat < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "stats"
        component_html_class: :stats,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def item(**options, &)
      generate_classes!(
        # "stat"
        component_html_class: :stat,
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def title(**options, &)
      generate_classes!(
        # "stat-title"
        component_html_class: :"stat-title",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def value(**options, &)
      generate_classes!(
        # "stat-value"
        component_html_class: :"stat-value",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def desc(**options, &)
      generate_classes!(
        # "stat-desc"
        component_html_class: :"stat-desc",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def figure(**options, &)
      generate_classes!(
        # "stat-figure"
        component_html_class: :"stat-figure",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def actions(**options, &)
      generate_classes!(
        # "stat-actions"
        component_html_class: :"stat-actions",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:stats-horizontal"
      # "@sm:stats-horizontal"
      # "md:stats-horizontal"
      # "@md:stats-horizontal"
      # "lg:stats-horizontal"
      # "@lg:stats-horizontal"
      horizontal: "stats-horizontal",
      # "sm:stats-vertical"
      # "@sm:stats-vertical"
      # "md:stats-vertical"
      # "@md:stats-vertical"
      # "lg:stats-vertical"
      # "@lg:stats-vertical"
      vertical: "stats-vertical"
    )
  end
end
