require 'spec_helper'
require 'spree/core'

describe Refinery do
  describe 'Store' do
    describe 'Admin' do
      login_refinery_superuser

      context "Get /refinery" do
        before do
          visit refinery.admin_root_path
        end

        it "should see refinery dashboard" do
          page.should have_content("Dashboard")
        end

        it "should integrate spree store tab" do
          click_link "Store"
          page.should have_content("Listing Orders")
        end
      end

      context "GET /store/admin/" do
        before do
          visit spree.admin_path
        end

        it "should see spree orders admin panel with refinery layout" do
          page.should have_content("Listing Orders")
        end

        it "should have store menu on the refinery layout" do
          page.should have_selector("div#admin-menu")
        end
      end

      context "GET /store/admin/products" do
        before do
          visit spree.admin_products_path
        end

        it "should see spree products admin panel" do
          page.should have_content("Listing Products")
        end

        it "should have products submenu" do
          page.should have_selector("div#sub-menu")
        end
      end
    end
  end
end
