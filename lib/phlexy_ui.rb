require "phlex"
require "zeitwerk"
require_relative "phlexy_ui/version"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect(
  "phlexy_ui" => "PhlexyUI"
)
loader.setup # ready!

module PhlexyUI
  extend Phlex::Kit
end

loader.eager_load
