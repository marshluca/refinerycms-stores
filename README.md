refinerycms-stores
=================

Stores engine for Refinery CMS


## Installation
    
Before setup refinerycms-stores, make sure refinerycms-core has been installed:

    bundle exec rails g refinery:cms --fresh-installation

then install refinerycms-stores:
    
    bundle exec rails g refinery:stores
    bundle exec rake db:migrate
    bundle exec rake db:seed
    bundle exec rails s


Now you can visit [http://localhost:3000/refinery](http://localhost:3000/refinery) to register your account.


If you want to be an administrator, run it in console:

    > u = Refinery::User.first
    > u.spree_roles.create :name => 'admin'

Now you can access
[http://localhost:3000/store/admin](http://localhost:3000/store/admin)
to manage your store.
