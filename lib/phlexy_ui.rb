require "phlex"
require "zeitwerk"
require_relative "phlexy_ui/version"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect(
  "phlexy_ui" => "PhlexyUI"
)
loader.setup # ready!
loader.load_file("#{__dir__}/phlexy_ui/base.rb")

module PhlexyUI
  extend Configurable
  extend Phlex::Kit
end
