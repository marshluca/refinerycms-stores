# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.authors           = ['Lin Zhang']
  s.email             = ['marshluca@gmail.com']
  s.homepage          = %q{https://github.com/marshluca/refinerycms-stores}
  s.license           = %q{MIT}
  s.name              = 'refinerycms-stores'
  s.version           = '0.1'
  s.description       = 'Stores engine for Refinery CMS'
  s.date              = '2013-03-19'
  s.summary           = 'Stores engine for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.9'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.9'
end
