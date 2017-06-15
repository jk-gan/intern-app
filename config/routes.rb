Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'companies#index'

  resources :companies, shallow: true do
    resources :contacts, only: [:new, :create, :edit, :update]
  end

  get 'tags/:tag', to: 'companies#index', as: :tag
end
