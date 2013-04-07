source "https://rubygems.org"

gemspec

gem 'jquery-rails', '~> 2.2.0'

# RefineryCMS
# refinerycms ~> 2.1.0.dev will require jquery-rails ~> 2.2.0
gem 'refinerycms', :path => '~/Codes/marshluca/refinerycms'
gem 'refinerycms-i18n', :path => '~/Codes/github/refinerycms-i18n'
# gem 'refinerycms', '~> 2.0.10'
# gem 'refinerycms-i18n', '~> 2.0.2'

# Spree Models and Mailers
# spree_core >= 1.3.2 requires jquery-rails ~> 2.2.0
gem 'spree', :path => '~/Codes/marshluca/spree'
# gem 'spree_core',   '1.2.0'
# gem 'spree_promo',  '1.2.0'
# gem 'spree_sample', '~> 1.2.0'
# gem 'spree_dash',   '~> 1.2.0'

gem 'rack-rewrite', '~> 1.0.2'

group :development do
  gem 'rb-readline'
  gem 'quiet_assets'
  # gem 'refinerycms-testing', '~> 2.0.10'
end

# Database Configuration
platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter'
  gem 'activerecord-jdbcmysql-adapter'
  gem 'activerecord-jdbcpostgresql-adapter'
  gem 'jruby-openssl'
end

platforms :ruby do
  gem 'sqlite3'
  gem 'mysql2'
  gem 'pg'
end

group :development, :test do
  gem 'guard-rspec', '~> 0.7.0'
  gem 'thin'

  platforms :mswin, :mingw do
    gem 'win32console', '~> 1.3.0'
    gem 'rb-fchange', '~> 0.0.5'
    gem 'rb-notifu', '~> 0.0.4'
  end

  platforms :ruby do
    gem 'spork', '~> 0.9.0'
    gem 'guard-spork', '~> 0.5.2'

    unless ENV['TRAVIS']
      require 'rbconfig'
      if RbConfig::CONFIG['target_os'] =~ /darwin/i
        gem 'rb-fsevent', '~> 0.9.0'
        gem 'ruby_gntp', '~> 0.3.4'
      end
      if RbConfig::CONFIG['target_os'] =~ /linux/i
        gem 'rb-inotify', '~> 0.9'
        gem 'libnotify',  '~> 0.7.2'
        gem 'therubyracer', '~> 0.10.0'
      end
    end
  end

  platforms :jruby do
    unless ENV['TRAVIS']
      require 'rbconfig'
      if RbConfig::CONFIG['target_os'] =~ /darwin/i
        gem 'ruby_gntp', '~> 0.3.4'
      end
      if RbConfig::CONFIG['target_os'] =~ /linux/i
        gem 'rb-inotify', '~> 0.9'
        gem 'libnotify',  '~> 0.7.2'
      end
    end
  end
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

