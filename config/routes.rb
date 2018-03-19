Rails.application.routes.draw do

  devise_for :users, :controllers => {:omniauth_callbacks => 'users/omniauth_callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'

  resources :users do
    scope module: :users do
      get '/position-management', to: 'position_management#edit'  # Gives /users/:user_id/position-management(.:format) users/position_management#edit
      patch '/position-management', to: 'position_management#update'
      put '/position-management', to: 'position_management#update'
      resources :positions, only: [:index]
      resources :boats
    end
  end

  resources :positions, except: [:show] do
    scope module: :positions do
      resources :users, only: [:index]
    end
  end

  resources :boats, only: [:index, :show]

end
