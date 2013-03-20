module Refinery
  module Stores
    include ActiveSupport::Configurable

    config_accessor :validate_source_url, :products_per_page

    self.validate_source_url = false
    self.products_per_page = 10
  end
end

