# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'page_cell/version'

Gem::Specification.new do |spec|
  spec.name          = "page_cell"
  spec.version       = PageCell::VERSION
  spec.authors       = ["Xue Shibing"]
  spec.email         = ["xueshibing@shinetechchina.com"]
  spec.description   = %q{A engine for refinerycms-page}
  spec.summary       = %q{A engine for refinerycms-page}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  #spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency('temple', ['~> 0.6.2'])
  spec.add_runtime_dependency('tilt', ['~> 1.3.3'])
  spec.add_runtime_dependency('cells')
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
