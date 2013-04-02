require 'refinerycms-core'

module Refinery
  autoload :StoresGenerator, 'generators/refinery/stores_generator'

  module Stores
    require 'refinery/stores/engine'
    require 'refinery/stores/configuration'
    require 'refinery/stores/override'

    autoload :Version, 'refinery/stores/version'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def version
        ::Refinery::Stores::Version.to_s
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
