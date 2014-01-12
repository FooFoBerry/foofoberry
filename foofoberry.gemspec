# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'foofoberry/version'

Gem::Specification.new do |spec|
  spec.name          = "foofoberry"
  spec.version       = Foofoberry::VERSION
  spec.authors       = ["Tyler Long", "Nathaniel Watts"]
  spec.email         = ["tyler.stephen.long@gmail.com", "reg@nathanielwatts.com"]
  spec.summary       = "A gem to interface with the FooFoBerry API"
  spec.description   = "Check the summary."
  spec.homepage      = "http://github.com/foofoberry/foofoberry"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_runtime_dependency "faraday"
  spec.add_runtime_dependency "json"
end
