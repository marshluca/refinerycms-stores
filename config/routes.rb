Refinery::Core::Engine.routes.draw do
  mount Spree::Core::Engine, :at => '/spree'
end

Refinery::Core::Engine.routes.append do
  mount Refinery::Core::Engine, :at => "/"
end


