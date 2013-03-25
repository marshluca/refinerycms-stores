__END__
require 'spec_helper'

module Refinery
  module Stores
    describe Category do
      describe "validations" do
        subject do
          FactoryGirl.create(:order,
          :title => "Refinery CMS category")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:title) { should == "Refinery CMS category" }
      end
    end
  end
end
