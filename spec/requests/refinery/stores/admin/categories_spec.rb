# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Stores" do
    describe "Admin" do
      describe "categories" do
        login_refinery_user

        describe "category list" do
          before do
            FactoryGirl.create(:category, :title => "ProductCategoryOne")
            FactoryGirl.create(:category, :title => "ProductCategoryTwo")
          end

          it "shows two categories" do
            visit refinery.stores_admin_categories_path
            page.should have_content("ProductCategoryOne")
            page.should have_content("ProductCategoryTwo")
          end
        end

        describe "create a category" do
          before do
            visit refinery.stores_admin_categories_path
            click_link 'Add New Category'
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "Category Name for Products"
              click_button "Save"

              page.should have_content("Category Name for Products")
              Refinery::Stores::Category.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Stores::Category.count.should == 0
            end
          end

          context "duplicate data" do
            before do
              FactoryGirl.create :category, :name => "Unique category"
            end

            it "should fail" do
              visit refinery.stores_admin_categories_path
              click_link "Add New Category"
              fill_in "Name", :with => "Unique category"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Stores::Category.count.should == 1
            end
          end
        end

        describe "edit a category" do
          
        end

        describe "delete a category" do
          
        end
      end
    end
  end
end
