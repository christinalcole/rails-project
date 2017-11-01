Rails.application.routes.draw do

  devise_for :users, :controllers => {:omniauth_callbacks => 'users/omniauth_callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'

  resources :users do
    scope module: :users do
      resources :positions, only: [:index]
    end
  end

  resources :positions, except: [:show]
end
