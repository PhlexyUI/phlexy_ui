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
  autoload :Tabs, "phlexy_ui/tabs"
  autoload :Drawer, "phlexy_ui/drawer"
  autoload :Dropdown, "phlexy_ui/dropdown"
  autoload :Menu, "phlexy_ui/menu"
  autoload :SubMenu, "phlexy_ui/sub_menu"
  autoload :CollapsibleSubMenu, "phlexy_ui/collapsible_sub_menu"
end

loader.eager_load
