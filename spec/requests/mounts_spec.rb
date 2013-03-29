require 'spec_helper'

describe Refinery do
  describe 'Store' do
    login_refinery_user

    describe "GET /refinery/store" do

      it "should see store admin panel" do
        visit '/refinery/store'
        page.should have_content("Listing Orders")
      end
    end
  end
end
