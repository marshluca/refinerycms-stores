require 'spree/core'
require 'deface'

module Refinery
  module Stores
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::Stores

      engine_name :refinery_stores

      initializer "register refinerycms_stores plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "refinerycms_stores"
          plugin.url = proc { Spree::Core::Engine.routes.url_helpers.admin_path }
          plugin.pathname = root
          plugin.menu_match = /store\/admin\/?(products|orders)?/
          plugin.activity = { :class_name => :'spree/product' }
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

        Deface::Override.new(
          :virtual_path => "layouts/refinery/admin",
          :name => "spree-menu",
          :insert_before => "div#flash_container",
          :partial => "refinery/override/spree_menu"
        )
      end

      config.to_prepare &method(:activate).to_proc

    end
  end
end
