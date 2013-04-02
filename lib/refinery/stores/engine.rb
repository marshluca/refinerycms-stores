require 'spree/core'

module Refinery
  module Stores
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::Stores

      engine_name :refinery_stores

      initializer "register refinerycms_stores plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "refinerycms_stores"
          plugin.url = "/store/admin" # proc { Refinery::Core::Engine.routes.url_helpers.stores_admin_products_path }
          plugin.pathname = root
          plugin.menu_match = /refinery\/stores\/?(products|categories)?/
          plugin.activity = { :class_name => :'refinery/stores/product' }
        end
      end

      def self.activate
        # Dir.glob(File.join(File.dirname(__FILE__), "../../../app/**/*_decorator*.rb")) do |c|
        #   Rails.configuration.cache_classes ? require(c) : load(c)
        # end

        ::ApplicationController.send :include, Spree::AuthenticationHelpers
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Stores)
      end

      config.to_prepare &method(:activate).to_proc

    end
  end
end
