require 'spec_helper'

describe Refinery do
  describe "Stores" do
    describe "Mount" do
        login_refinery_user

        describe "GET /refinery/store" do

          it "shows two items" do
            visit refinery.store_admin_products_path
            page.should have_content("Spree Store")
          end
        end
    end
  end
end
