__END__
module Refinery
  module Stores
    class Variant < Refinery::Core::BaseModel
      belongs_to :product

      attr_accessible :cost_price, :count_on_hand, :deleted_at, :depth, :height, :is_master, :position, :price, :sku, :weight, :width
    end
  end
end
