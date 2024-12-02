module PhlexHelpers
  class TestContext < Phlex::HTML
    def view_template(&)
      div(&)
    end
  end

  def phlex_context(&)
    render TestContext.new, &
  end
end

module Phlex
  module Testing
    module ViewHelper
      include Phlex::Testing::SGML

      alias render render_to_string
    end
  end
end

RSpec.configure do |config|
  config.include Phlex::Testing::ViewHelper
  config.include PhlexHelpers
  config.include PhlexyUI
end
