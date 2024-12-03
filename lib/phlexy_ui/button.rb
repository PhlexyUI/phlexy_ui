# frozen_string_literal: true

require "phlex/version"

module PhlexyUI
  class Button < Base
    def initialize(*, as: :button, modal: nil, **)
      super(*, **)
      @as = as
      @modal = modal
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :btn,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        if modal
          public_send(
            as,
            class: classes,
            onclick: safe("#{Phlex::Escape.html_escape(modal)}.showModal()"),
            **options,
            &
          )
        else
          public_send(as, class: classes, **options, &)
        end
      end
    end

    private

    attr_reader :modal

    # TODO: Remove this once Phlex 2.0 is released.
    #
    # The cleanest way to do this is with a single:
    #
    # onclick: "#{Phlex::Escape.html_escape(modal)}.showModal()"
    #
    # However, currently, Phlex does not allow you to use the "onclick"
    # attribute.
    #
    # Once Phlex 2.0 is released, it will add a #safe method
    # that will allow us to replace this with a single line:
    #
    # onclick: safe("#{Phlex::Escape.html_escape(modal)}.showModal()")
    def build_button_via_unsafe_raw(classes, &)
      classes = Phlex::Escape.html_escape(classes.join(" "))
      @options = options
        .merge(onclick: "#{modal}.showModal()")
        .reduce("") do |acc, (k, v)|
        if k == :data
          v.each do |k, v|
            k = Phlex::Escape.html_escape(k)
            v = Phlex::Escape.html_escape(v)
            acc += " data-#{k}=\"#{v}\""
          end
          acc
        else
          k = Phlex::Escape.html_escape(k)
          v = Phlex::Escape.html_escape(v)
          "#{acc} #{k}=\"#{v}\""
        end
      end.strip

      unsafe_raw %(<button class="#{classes}" #{options}>#{capture(&)}</button>)
    end

    register_modifiers(
      # "sm:no-animation"
      # "md:no-animation"
      # "lg:no-animation"
      no_animation: "no-animation",
      # "sm:glass"
      # "md:glass"
      # "lg:glass"
      glass: "glass",
      # "sm:btn-ghost"
      # "md:btn-ghost"
      # "lg:btn-ghost"
      ghost: "btn-ghost",
      # "sm:btn-link"
      # "md:btn-link"
      # "lg:btn-link"
      link: "btn-link",
      # "sm:btn-outline"
      # "md:btn-outline"
      # "lg:btn-outline"
      outline: "btn-outline",
      # "sm:btn-active"
      # "md:btn-active"
      # "lg:btn-active"
      active: "btn-active",
      # "sm:btn-disabled"
      # "md:btn-disabled"
      # "lg:btn-disabled"
      disabled: "btn-disabled",
      # "sm:btn-lg"
      # "md:btn-lg"
      # "lg:btn-lg"
      lg: "btn-lg",
      # "sm:btn-md"
      # "md:btn-md"
      # "lg:btn-md"
      md: "btn-md",
      # "sm:btn-sm"
      # "md:btn-sm"
      # "lg:btn-sm"
      sm: "btn-sm",
      # "sm:btn-xs"
      # "md:btn-xs"
      # "lg:btn-xs"
      xs: "btn-xs",
      # "sm:btn-wide"
      # "md:btn-wide"
      # "lg:btn-wide"
      wide: "btn-wide",
      # "sm:btn-block"
      # "md:btn-block"
      # "lg:btn-block"
      block: "btn-block",
      # "sm:btn-circle"
      # "md:btn-circle"
      # "lg:btn-circle"
      circle: "btn-circle",
      # "sm:btn-square"
      # "md:btn-square"
      # "lg:btn-square"
      square: "btn-square",
      # Colors
      # "sm:btn-neutral"
      # "md:btn-neutral"
      # "lg:btn-neutral"
      neutral: "btn-neutral",
      # "sm:btn-primary"
      # "md:btn-primary"
      # "lg:btn-primary"
      primary: "btn-primary",
      # "sm:btn-secondary"
      # "md:btn-secondary"
      # "lg:btn-secondary"
      secondary: "btn-secondary",
      # "sm:btn-accent"
      # "md:btn-accent"
      # "lg:btn-accent"
      accent: "btn-accent",
      # "sm:btn-info"
      # "md:btn-info"
      # "lg:btn-info"
      info: "btn-info",
      # "sm:btn-success"
      # "md:btn-success"
      # "lg:btn-success"
      success: "btn-success",
      # "sm:btn-warning"
      # "md:btn-warning"
      # "lg:btn-warning"
      warning: "btn-warning",
      # "sm:btn-error"
      # "md:btn-error"
      # "lg:btn-error"
      error: "btn-error"
    ).freeze
  end
end
