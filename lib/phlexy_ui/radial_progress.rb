# frozen_string_literal: true

module PhlexyUI
  class RadialProgress < Base
    def initialize(*, value:, as: :div, size: nil, thickness: nil, **)
      super(*, **)
      @as = as
      @value = value
      @size = size
      @thickness = thickness
    end

    def view_template(&)
      generate_classes!(
        # "radial-progress"
        component_html_class: :"radial-progress",
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        style = options.delete(:style)

        if style.nil?
          style = "--value: #{value};"

          if size && !size.empty?
            style += " --size: #{size};"
          end

          if thickness && !thickness.empty?
            style += " --thickness: #{thickness};"
          end
        elsif style.is_a?(String)
          style = "#{style} --value: #{value};"

          if size && !size.empty?
            style += " --size: #{size};"
          end

          if thickness && !thickness.empty?
            style += " --thickness: #{thickness};"
          end
        end

        public_send(as, role: :progressbar, class: classes, style:, **options, &)
      end
    end

    private

    attr_reader :value, :size, :thickness

    register_modifiers(
      # "sm:bg-primary sm:text-primary-content border-primary"
      # "@sm:bg-primary @sm:text-primary-content @sm:border-primary"
      # "md:bg-primary md:text-primary-content border-primary"
      # "@md:bg-primary @md:text-primary-content @md:border-primary"
      # "lg:bg-primary lg:text-primary-content border-primary"
      # "@lg:bg-primary @lg:text-primary-content @lg:border-primary"
      primary: "bg-primary text-primary-content border-primary",
      # "sm:text-primary"
      # "@sm:text-primary"
      # "md:text-primary"
      # "@md:text-primary"
      # "lg:text-primary"
      # "@lg:text-primary"
      primary_outline: "text-primary",
      # "sm:bg-secondary sm:text-secondary-content border-secondary"
      # "@sm:bg-secondary @sm:text-secondary-content @sm:border-secondary"
      # "md:bg-secondary md:text-secondary-content border-secondary"
      # "@md:bg-secondary @md:text-secondary-content @md:border-secondary"
      # "lg:bg-secondary lg:text-secondary-content border-secondary"
      # "@lg:bg-secondary @lg:text-secondary-content @lg:border-secondary"
      secondary: "bg-secondary text-secondary-content border-secondary",
      # "sm:text-secondary"
      # "@sm:text-secondary"
      # "md:text-secondary"
      # "@md:text-secondary"
      # "lg:text-secondary"
      # "@lg:text-secondary"
      secondary_outline: "text-secondary",
      # "sm:bg-accent sm:text-accent-content border-accent"
      # "@sm:bg-accent @sm:text-accent-content @sm:border-accent"
      # "md:bg-accent md:text-accent-content border-accent"
      # "@md:bg-accent @md:text-accent-content @md:border-accent"
      # "lg:bg-accent lg:text-accent-content border-accent"
      # "@lg:bg-accent @lg:text-accent-content @lg:border-accent"
      accent: "bg-accent text-accent-content border-accent",
      # "sm:text-accent"
      # "@sm:text-accent"
      # "md:text-accent"
      # "@md:text-accent"
      # "lg:text-accent"
      # "@lg:text-accent"
      accent_outline: "text-accent",
      # "sm:bg-neutral sm:text-neutral-content border-neutral"
      # "@sm:bg-neutral @sm:text-neutral-content @sm:border-neutral"
      # "md:bg-neutral md:text-neutral-content border-neutral"
      # "@md:bg-neutral @md:text-neutral-content @md:border-neutral"
      # "lg:bg-neutral lg:text-neutral-content border-neutral"
      # "@lg:bg-neutral @lg:text-neutral-content @lg:border-neutral"
      neutral: "bg-neutral text-neutral-content border-neutral",
      # "sm:text-neutral"
      # "@sm:text-neutral"
      # "md:text-neutral"
      # "@md:text-neutral"
      # "lg:text-neutral"
      # "@lg:text-neutral"
      neutral_outline: "text-neutral",
      # "sm:bg-base-100 sm:text-base-content border-base-100"
      # "@sm:bg-base-100 @sm:text-base-content @sm:border-base-100"
      # "md:bg-base-100 md:text-base-content border-base-100"
      # "@md:bg-base-100 @md:text-base-content @md:border-base-100"
      # "lg:bg-base-100 lg:text-base-content border-base-100"
      # "@lg:bg-base-100 @lg:text-base-content @lg:border-base-100"
      base_100: "bg-base-100 text-base-content border-base-100",
      # "sm:text-base-100"
      # "@sm:text-base-100"
      # "md:text-base-100"
      # "@md:text-base-100"
      # "lg:text-base-100"
      # "@lg:text-base-100"
      base_100_outline: "text-base-100",
      # "sm:bg-base-200 sm:text-base-content border-base-200"
      # "@sm:bg-base-200 @sm:text-base-content @sm:border-base-200"
      # "md:bg-base-200 md:text-base-content border-base-200"
      # "@md:bg-base-200 @md:text-base-content @md:border-base-200"
      # "lg:bg-base-200 lg:text-base-content border-base-200"
      # "@lg:bg-base-200 @lg:text-base-content @lg:border-base-200"
      base_200: "bg-base-200 text-base-content border-base-200",
      # "sm:text-base-200"
      # "@sm:text-base-200"
      # "md:text-base-200"
      # "@md:text-base-200"
      # "lg:text-base-200"
      # "@lg:text-base-200"
      base_200_outline: "text-base-200",
      # "sm:bg-base-300 sm:text-base-content border-base-300"
      # "@sm:bg-base-300 @sm:text-base-content @sm:border-base-300"
      # "md:bg-base-300 md:text-base-content border-base-300"
      # "@md:bg-base-300 @md:text-base-content @md:border-base-300"
      # "lg:bg-base-300 lg:text-base-content border-base-300"
      # "@lg:bg-base-300 @lg:text-base-content @lg:border-base-300"
      base_300: "bg-base-300 text-base-content border-base-300",
      # "sm:text-base-300"
      # "@sm:text-base-300"
      # "md:text-base-300"
      # "@md:text-base-300"
      # "lg:text-base-300"
      # "@lg:text-base-300"
      base_300_outline: "text-base-300",
      # "sm:bg-info sm:text-info-content border-info"
      # "@sm:bg-info @sm:text-info-content @sm:border-info"
      # "md:bg-info md:text-info-content border-info"
      # "@md:bg-info @md:text-info-content @md:border-info"
      # "lg:bg-info lg:text-info-content border-info"
      # "@lg:bg-info @lg:text-info-content @lg:border-info"
      info: "bg-info text-info-content border-info",
      # "sm:text-info"
      # "@sm:text-info"
      # "md:text-info"
      # "@md:text-info"
      # "lg:text-info"
      # "@lg:text-info"
      info_outline: "text-info",
      # "sm:bg-success sm:text-success-content border-success"
      # "@sm:bg-success @sm:text-success-content @sm:border-success"
      # "md:bg-success md:text-success-content border-success"
      # "@md:bg-success @md:text-success-content @md:border-success"
      # "lg:bg-success lg:text-success-content border-success"
      # "@lg:bg-success @lg:text-success-content @lg:border-success"
      success: "bg-success text-success-content border-success",
      # "sm:text-success"
      # "@sm:text-success"
      # "md:text-success"
      # "@md:text-success"
      # "lg:text-success"
      # "@lg:text-success"
      success_outline: "text-success",
      # "sm:bg-warning sm:text-warning-content border-warning"
      # "@sm:bg-warning @sm:text-warning-content @sm:border-warning"
      # "md:bg-warning md:text-warning-content border-warning"
      # "@md:bg-warning @md:text-warning-content @md:border-warning"
      # "lg:bg-warning lg:text-warning-content border-warning"
      # "@lg:bg-warning @lg:text-warning-content @lg:border-warning"
      warning: "bg-warning text-warning-content border-warning",
      # "sm:text-warning"
      # "@sm:text-warning"
      # "md:text-warning"
      # "@md:text-warning"
      # "lg:text-warning"
      # "@lg:text-warning"
      warning_outline: "text-warning",
      # "sm:bg-error sm:text-error-content border-error"
      # "@sm:bg-error @sm:text-error-content @sm:border-error"
      # "md:bg-error md:text-error-content border-error"
      # "@md:bg-error @md:text-error-content @md:border-error"
      # "lg:bg-error lg:text-error-content border-error"
      # "@lg:bg-error @lg:text-error-content @lg:border-error"
      error: "bg-error text-error-content border-error"
    )
  end
end
