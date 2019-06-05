Rails.application.routes.draw do
  devise_for :users

  resources :users
  resources :milestones
  resources :contacts
  resources :properties
  resources :deals do
    resources :activities
  end

  root 'welcome#index'
  get 'dashboard', to: 'welcome#dashboard', as: :dashboard
end
