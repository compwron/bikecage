# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bikecage/version'

Gem::Specification.new do |spec|
  spec.name          = "bikecage"
  spec.version       = Bikecage::VERSION
  spec.authors       = ["Linda Goldstein"]
  spec.email         = ["linda.goldstein@getbraintree.com"]
  spec.summary       = "bike cage logic"
  spec.description   = "bike cage logic to imitate the SF bikelink system"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
