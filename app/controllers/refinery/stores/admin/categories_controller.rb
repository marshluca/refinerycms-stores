module Refinery
  module Stores
    module Admin
      class CategoriesController < ::Refinery::AdminController

        crudify :'refinery/stores/category', :xhr_paging => true

      end
    end
  end
end
