Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :stores do
    root :to => "products#index"
    resources :products, :only => [:show]
  end

  # Admin routes
  namespace :stores, :path => '' do
    namespace :admin, :path => 'refinery' do
      scope :path => 'stores' do
        root :to => "products#index"

        resources :products, :except => :show do
          collection do
            post :update_positions
          end
        end

        resources :categories

        resources :orders
      end
    end
  end

end
