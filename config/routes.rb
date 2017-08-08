Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'bicycles#index'

  resources :bicycles do
    resources :suggestions, except: [:index] do
      resource :approves, only: [:create, :destroy]
    end
  end

  resource :manages, only: [:show]
  resources :usages, only: [:update]
end
