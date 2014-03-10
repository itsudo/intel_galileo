# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'intel_galileo/version'

Gem::Specification.new do |spec|
  spec.name          = "intel_galileo"
  spec.version       = IntelGalileo::VERSION
  spec.authors       = ["Michal Pawlowski"]
  spec.email         = ["misza222@gmail.com"]
  spec.description   = %q{Gem for interacting with Intel Galileo board}
  spec.summary       = %q{Interact with Intel Galileo board}
  spec.homepage      = "https://github.com/itsudo/intel_galileo"
  spec.license       = "MIT"

  spec.files         = `git ls-files lib/`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>=1.9.2'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "fakefs"
  spec.add_development_dependency "mocha"
end
