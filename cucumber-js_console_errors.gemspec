# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cucumber/js_console_errors/version'

Gem::Specification.new do |spec|
  spec.name          = "cucumber-js_console_errors"
  spec.version       = Cucumber::JsConsoleErrors::VERSION
  spec.authors       = ["Declan McGrath"]
  spec.email         = ["declan.mcgrath@clavisinsight.com"]
  spec.summary       = %q{Capture Javascript errors that occur during the running of a Selenium-based Cucumber test}
  spec.description   = %q{Capture Javascript errors that occur during the running of a Selenium-based Cucumber test}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
