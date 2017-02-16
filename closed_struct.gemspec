# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'closed_struct/version'

Gem::Specification.new do |spec|
  spec.name          = "closed_struct"
  spec.version       = ClosedStruct::VERSION
  spec.authors       = ["Paweł Obrok"]
  spec.email         = ["pawel.obrok@gmail.com"]
  spec.summary       = %q{An immutable, strict version of OpenStruct}
  spec.description   = %q{ClosedStructs work like OpenStruct, with the exception of being immutable and not responding to methods which haven't been listed in the input hash}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
