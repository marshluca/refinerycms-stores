# Encoding: UTF-8
require File.expand_path('../lib/refinery/stores/version', __FILE__)

version = Refinery::Stores::Version.to_s

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.authors           = ['Lin Zhang']
  s.email             = ['marshluca@gmail.com']
  s.homepage          = %q{https://github.com/marshluca/refinerycms-stores}
  s.license           = %q{MIT}
  s.name              = 'refinerycms-stores'
  s.version           = version
  s.description       = 'Stores engine for Refinery CMS'
  s.date              = '2013-03-19'
  s.summary           = 'Stores engine for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["README.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.10'
  s.add_dependency             'spree_core',          '1.2.0'
  s.add_dependency             'spree_promo',         '1.2.0'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.10'
end
