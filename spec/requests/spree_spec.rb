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
      end

      describe "GET /store/admin/products" do
        it "should see spree products admin panel" do
          visit spree.admin_products_path
          page.should have_content("Listing Products")
        end
      end
    end
  end
end
