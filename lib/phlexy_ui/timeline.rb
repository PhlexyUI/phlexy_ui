# frozen_string_literal: true

module PhlexyUI
  # @component html class="timeline"
  class Timeline < Base
    def initialize(*, as: :ul, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "timeline"
        component_html_class: :timeline,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def start(**options, &)
      generate_classes!(
        # "timeline-start"
        component_html_class: :"timeline-start",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def middle(**options, &)
      generate_classes!(
        # "timeline-middle"
        component_html_class: :"timeline-middle",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def end(**options, &)
      generate_classes!(
        # "timeline-end"
        component_html_class: :"timeline-end",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:timeline-snap-icon"
      # "@sm:timeline-snap-icon"
      # "md:timeline-snap-icon"
      # "@md:timeline-snap-icon"
      # "lg:timeline-snap-icon"
      # "@lg:timeline-snap-icon"
      snap_icon: "timeline-snap-icon",
      # "sm:timeline-box"
      # "@sm:timeline-box"
      # "md:timeline-box"
      # "@md:timeline-box"
      # "lg:timeline-box"
      # "@lg:timeline-box"
      box: "timeline-box",
      # "sm:timeline-compact"
      # "@sm:timeline-compact"
      # "md:timeline-compact"
      # "@md:timeline-compact"
      # "lg:timeline-compact"
      # "@lg:timeline-compact"
      compact: "timeline-compact",
      # "sm:timeline-vertical"
      # "@sm:timeline-vertical"
      # "md:timeline-vertical"
      # "@md:timeline-vertical"
      # "lg:timeline-vertical"
      # "@lg:timeline-vertical"
      vertical: "timeline-vertical",
      # "sm:timeline-horizontal"
      # "@sm:timeline-horizontal"
      # "md:timeline-horizontal"
      # "@md:timeline-horizontal"
      # "lg:timeline-horizontal"
      # "@lg:timeline-horizontal"
      horizontal: "timeline-horizontal"
    )
  end
end
