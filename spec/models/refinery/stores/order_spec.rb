require 'spec_helper'

module Refinery
  module Stores
    describe Order do
      describe "validations" do
        subject do
          FactoryGirl.create(:order,
          :title => "Refinery CMS order")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:title) { should == "Refinery CMS order" }
      end
    end
  end
end
