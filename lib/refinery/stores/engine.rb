module Refinery
  module Stores
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::Stores

      engine_name :refinery_stores

      initializer "register refinerycms_stores plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "refinerycms_stores"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.stores_admin_products_path }
          plugin.pathname = root
          plugin.menu_match = /refinery\/stores\/?(products|categories)?/
          plugin.activity = { :class_name => :'refinery/stores/product' }
        end
      end



      config.after_initialize do
        Refinery.register_extension(Refinery::Stores)
      end
    end
  end
end
