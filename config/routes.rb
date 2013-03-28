Refinery::Core::Engine.routes.draw do
  mount Spree::Core::Engine, :at => '/store'
end

