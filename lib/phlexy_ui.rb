require "phlex"
require "zeitwerk"
require_relative "phlexy_ui/version"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect(
  "phlexy_ui" => "PhlexyUI"
)
loader.setup # ready!

module PhlexyUI
  extend Configurable
  extend Phlex::Kit

  autoload :Button, "phlexy_ui/button"
  autoload :Card, "phlexy_ui/card"
end

loader.eager_load
