refinerycms-stores
=================

Stores engine for Refinery CMS


## Installation

Add `refinerycms`, `refinerycms-stores` to your Gemfile:

    gem 'refinerycms', '~> 2.0.10'
    gem 'refinerycms-stores', :github => 'Shinetechchina/refinerycms-stores'

then run:

    bundle exec rails g refinery:cms --fresh-installation

If you want to be an administrator, run:
     
    bundle exec rake refinery:stores:create_administrator

Now you can start your application server and visit [http://localhost:3000/refinery](http://localhost:3000/refinery) with your registered account

    bundle exec rails s 
