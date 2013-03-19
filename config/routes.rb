Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :stores do
    resources :stores, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :stores, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :stores, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
