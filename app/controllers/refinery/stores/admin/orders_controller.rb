module Refinery
  module Stores
    module Admin
      class OrdersController < ::Refinery::AdminController

        crudify :'refinery/stores/order', :xhr_paging => true

      end
    end
  end
end
