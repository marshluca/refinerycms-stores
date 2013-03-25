module Refinery
  module Stores
    class Category < Refinery::Core::BaseModel
      self.table_name = 'refinery_product_categories'

      attr_accessible :name

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
