# Configure Spree Preferences
# 
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do: 
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to override the default site name.
  # config.site_name = "Spree Demo Site"
end

# Spree.user_class = "Spree::LegacyUser"
Spree.user_class = "Refinery::User"

# Spree logic overwrite
Spree::Admin::BaseController.class_eval do
  require 'refinery/core'
  require 'refinery/authentication'

  layout 'refinery/admin'
  helper Refinery::CustomAssetsHelper
  helper Refinery::SiteBarHelper
  helper Refinery::TagHelper
  helper Refinery::AdminHelper
  include Refinery::AuthenticatedSystem
end
