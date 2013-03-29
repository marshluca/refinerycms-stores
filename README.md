refinerycms-stores
=================

Stores engine for Refinery CMS


## Installation
    
    bundle install
    bundle exec rails g refinery:store 
    bundle exec rake db:migrate
    bundle exec rake db:seed
    bundle exec rails s


If you want to create an administrator,

    bundle exec rake refinery:stores:create_administrator


Now you can visit http://localhost:3000/refinery .
