module Refinery
  module Stores
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Stores

      engine_name :refinery_stores

      initializer "register refinerycms_stores plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "stores"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.stores_admin_stores_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/stores/store'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Stores)
      end
    end
  end
end
