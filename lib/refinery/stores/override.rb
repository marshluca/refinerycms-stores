require 'deface'

module Refinery
  module Stores
    class Override
      class << self
        def enable
          Deface::Override.new(
            :virtual_path => "layouts/refinery/admin",
            :name => "spree-menu",
            :insert_before => "div#flash_container",
            :partial => "refinery/override/spree_menu"
          )
        end
      end
    end
  end
end
