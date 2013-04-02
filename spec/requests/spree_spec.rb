require 'spec_helper'
require 'spree/core'

describe Refinery do
  describe 'Store' do
    describe 'Admin' do
      login_refinery_user

      describe "GET /store/admin/" do
        it "should see spree orders admin panel with refinery layout" do
          visit spree.admin_path
          page.should have_selector(:title, "Refinery")
          page.should have_content("Listing Orders")
        end

        it "should have store menu on the refinery layout" do
          visit spree.admin_path
          page.should have_selector("div#admin_menu")
        end
      end

      describe "GET /store/admin/products" do
        it "should see spree products admin panel" do
          visit spree.admin_products_path
          page.should have_content("Listing Products")
        end

        it "should have products submenu" do
          visit spree.admin_products_path
          page.should have_selector("div#sub-menu")
        end
      end
    end
  end
end
