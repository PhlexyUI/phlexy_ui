# frozen_string_literal: true

module PhlexyUI
  # @private
  #
  # Converts component modifiers and options into HTML attributes.
  # This is an internal class used by Base components.
  #
  # Internal Usage:
  #   # Component defines an attributes map
  #   ATTRIBUTES_MAP = { open: { checked: true }, closed: true }
  #
  #   # Attributes can come from modifiers or options:
  #   #   tab(:open)           #=> { checked: true }
  #   #   tab(open: true)      #=> { checked: true }
  #   #   tab(open: false)     #=> {}
  #   #   tab(:closed)         #=> { closed: true }
  #   #   tab(closed: true)    #=> { closed: true }
  #   #   tab(closed: false)   #=> {}
  class AttributeSet
    def initialize(base_modifiers, options, attributes_map)
      @base_modifiers = base_modifiers
      @options = options
      @attributes_map = attributes_map
    end

    def to_h
      result = {}

      # Process modifiers first
      base_modifiers.each do |modifier|
        next unless attributes_map.key?(modifier)
        next if options.key?(modifier)

        process_attribute(modifier, true, result)
      end

      # Then process options (overriding modifiers)
      options.each do |key, value|
        next unless attributes_map.key?(key)
        next unless value

        process_attribute(key, value, result)
      end

      result
    end

    private

    attr_reader :base_modifiers, :options, :attributes_map

    def process_attribute(key, value, result)
      mapped_value = attributes_map[key]

      if mapped_value.is_a?(Hash)
        result.merge!(mapped_value)
      else
        result[key] = mapped_value
      end
    end
  end
end
