module PhlexyUI
  module Configurable
    def configure
      self.configuration ||= Configuration.new
      yield(configuration) if block_given?
      configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end

    class Modifiers
      def initialize
        @modifiers = {}
      end

      def add(modifier, classes:, component: nil)
        @modifiers[component] ||= {}
        @modifiers[component][modifier] = classes
      end

      def remove(modifier, component: nil)
        @modifiers[component] ||= {}
        @modifiers[component]&.delete(modifier)
      end

      def for(component: nil)
        @modifiers[component] || {}
      end
    end

    class Configuration
      attr_accessor :prefix

      def initialize
        @prefix = nil
      end

      def modifiers
        @modifiers ||= Modifiers.new
      end
    end
  end
end
