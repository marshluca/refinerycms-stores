module Refinery
  module Stores
    module Admin
      class StoresController < ::Refinery::AdminController

        crudify :'refinery/stores/store', :xhr_paging => true

      end
    end
  end
end
