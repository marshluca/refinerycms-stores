module Refinery
  module Stores
    module Admin
      class ProductsController < ::Refinery::AdminController

        crudify :'refinery/stores/product', :xhr_paging => true

      end
    end
  end
end
