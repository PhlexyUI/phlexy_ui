module PhlexyUI
  class AttributeSet
    def initialize(base_modifiers, attributes_map)
      @base_modifiers = base_modifiers
      @attributes_map = attributes_map
    end

    def to_h
      attributes_modifiers.each_with_object({}) do |modifier, final_attributes_hash|
        value = attributes_map[modifier]

        if value.is_a?(Hash)
          final_attributes_hash.merge!(value)
        elsif value
          final_attributes_hash[modifier] = value
        end
      end
    end

    private

    attr_reader :base_modifiers, :attributes_map

    def attributes_modifiers
      base_modifiers.select { |modifier| attributes_map.key?(modifier) }
    end
  end
end
