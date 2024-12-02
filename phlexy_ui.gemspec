require_relative "lib/phlexy_ui/version"

Gem::Specification.new do |s|
  s.name = "phlexy_ui"
  s.version = PhlexyUI::VERSION
  s.licenses = ["MIT"]
  s.summary = "PhlexyUI is a Ruby UI component library for DaisyUI using Phlex"
  s.description = "PhlexyUI is a Ruby UI component library for DaisyUI using Phlex"
  s.authors = ["David Alejandro Aguilar Ramos"]
  s.email = "boil-dosage.0p@icloud.com"
  s.files = Dir["lib/**/*.rb"]
  s.homepage = "https://rubygems.org/gems/phlexy_ui"
  s.metadata = {"source_code_uri" => "https://github.com/PhlexyUI/phlexy_ui"}

  s.required_ruby_version = ">= 3.2"

  s.add_dependency "phlex", ">= 2.0.0.rc1"
  s.add_dependency "zeitwerk", "~> 2.6"

  s.add_development_dependency "standard", "~> 1.39.2"
  s.add_development_dependency "rspec", "~> 3.13.0"
  s.add_development_dependency "debug", "~> 1.9", ">= 1.9.2"
  s.add_development_dependency "rake", "~> 13.0"
end
