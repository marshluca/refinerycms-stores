require 'spec_helper'

describe Refinery do
  describe 'Store' do
    describe 'Admin' do
      login_refinery_user

      describe "GET /refinery/store" do

        it "should see store admin panel" do
          visit '/store/admin'
          page.should have_content("Listing Orders")
          page.should have_selector(:title, "Refinery")
        end
      end

    end
  end
end
