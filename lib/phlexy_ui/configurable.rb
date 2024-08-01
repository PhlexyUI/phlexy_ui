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

    class Configuration
      attr_accessor :prefix

      def initialize
        @prefix = nil
      end
    end
  end
end
