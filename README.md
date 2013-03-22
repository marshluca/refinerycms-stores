refinerycms-stores
=================

Stores engine for Refinery CMS

## Todo List

###Admin Area

* product management
* category management
* order management

###Front-end

* product list
  * list categories
  * filter products by category
* view one product
  * basic information
  * add to cart
  * email to friends
* shopping cart
  * editing the amount of products
  * remove products
  * checkout (PayPal, Credit Card)
* Sign in, Sign up, Sign out
* My Account
  * orders
  * linked Social Accounts
  * edit


## How to build this extension as a gem

    cd vendor/extensions/stores
    gem build refinerycms-stores.gemspec
    gem install refinerycms-stores.gem

    # Sign up for a http://rubygems.org/ account and publish the gem
    gem push refinerycms-stores.gem
