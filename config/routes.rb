Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'companies#index'

  resources :companies, shallow: true do
    resources :contacts, only: [:new, :create, :edit, :update]
    resources :jobs
  end

  resources :ratings, only: :update

  get 'tags/:tag', to: 'companies#index', as: :tag
end
