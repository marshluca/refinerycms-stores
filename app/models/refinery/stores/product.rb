mStoreodule Refinery
  module Stores
    class Product < Refinery::Core::BaseModel
      self.table_name = 'refinery_products'

      attr_accessible :title, :description, :image_id, :file_id, :position

      translates :title, :description

      class Translation
        attr_accessible :locale
      end

      acts_as_indexed :fields => [:title, :description]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :image, :class_name => '::Refinery::Image'

      belongs_to :file, :class_name => '::Refinery::Resource'
    end
  end
end
