# frozen_string_literal: true

module PhlexyUI
  # @component html class="chat"
  class Chat < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        # "chat"
        component_html_class: :chat,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def image(**options, &)
      generate_classes!(
        # "chat-image"
        component_html_class: :"chat-image",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def header(**options, &)
      generate_classes!(
        # "chat-header"
        component_html_class: :"chat-header",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def bubble(*modifiers, **options, &)
      generate_classes!(
        # "chat-bubble"
        component_html_class: :"chat-bubble",
        modifiers_map: bubble_modifiers,
        base_modifiers: modifiers,
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def bubble_modifiers
      {
        # "sm:chat-bubble-neutral"
        # "@sm:chat-bubble-neutral"
        # "md:chat-bubble-neutral"
        # "@md:chat-bubble-neutral"
        # "lg:chat-bubble-neutral"
        # "@lg:chat-bubble-neutral"
        neutral: "chat-bubble-neutral",
        # "sm:chat-bubble-primary"
        # "@sm:chat-bubble-primary"
        # "md:chat-bubble-primary"
        # "@md:chat-bubble-primary"
        # "lg:chat-bubble-primary"
        # "@lg:chat-bubble-primary"
        primary: "chat-bubble-primary",
        # "sm:chat-bubble-secondary"
        # "@sm:chat-bubble-secondary"
        # "md:chat-bubble-secondary"
        # "@md:chat-bubble-secondary"
        # "lg:chat-bubble-secondary"
        # "@lg:chat-bubble-secondary"
        secondary: "chat-bubble-secondary",
        # "sm:chat-bubble-accent"
        # "@sm:chat-bubble-accent"
        # "md:chat-bubble-accent"
        # "@md:chat-bubble-accent"
        # "lg:chat-bubble-accent"
        # "@lg:chat-bubble-accent"
        accent: "chat-bubble-accent",
        # "sm:chat-bubble-info"
        # "@sm:chat-bubble-info"
        # "md:chat-bubble-info"
        # "@md:chat-bubble-info"
        # "lg:chat-bubble-info"
        # "@lg:chat-bubble-info"
        info: "chat-bubble-info",
        # "sm:chat-bubble-success"
        # "@sm:chat-bubble-success"
        # "md:chat-bubble-success"
        # "@md:chat-bubble-success"
        # "lg:chat-bubble-success"
        # "@lg:chat-bubble-success"
        success: "chat-bubble-success",
        # "sm:chat-bubble-warning"
        # "@sm:chat-bubble-warning"
        # "md:chat-bubble-warning"
        # "@md:chat-bubble-warning"
        # "lg:chat-bubble-warning"
        # "@lg:chat-bubble-warning"
        warning: "chat-bubble-warning",
        # "sm:chat-bubble-error"
        # "@sm:chat-bubble-error"
        # "md:chat-bubble-error"
        # "@md:chat-bubble-error"
        # "lg:chat-bubble-error"
        # "@lg:chat-bubble-error"
        error: "chat-bubble-error"
      }
    end

    def footer(**options, &)
      generate_classes!(
        # "chat-footer"
        component_html_class: :"chat-footer",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    register_modifiers(
      # "sm:chat-start"
      # "@sm:chat-start"
      # "md:chat-start"
      # "@md:chat-start"
      # "lg:chat-start"
      # "@lg:chat-start"
      start: "chat-start",
        # "sm:chat-end"
        # "@sm:chat-end"
        # "md:chat-end"
        # "@md:chat-end"
        # "lg:chat-end"
        # "@lg:chat-end"
      end: "chat-end"
    )
  end
end
