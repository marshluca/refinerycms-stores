refinerycms-stores
=================

Stores engine for Refinery CMS


## Installation
    
Before setup refinerycms-stores, make sure refinerycms-core has been installed:

    bundle exec rails g refinery:cms --fresh-installation

then install refinerycms-stores:
    
    bundle exec rails g refinery:store 
    bundle exec rake db:migrate
    bundle exec rake db:seed
    bundle exec rails s

If you want to create an administrator,

    bundle exec rake refinery:stores:create_administrator


Now you can visit http://localhost:3000/refinery .
