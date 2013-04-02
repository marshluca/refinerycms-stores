# Refinery logic overwrite
Refinery::AdminController.class_eval do
  helper Spree::Admin::NavigationHelper
end
