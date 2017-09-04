Rails.application.routes.draw do

  root to: "companies#index"

  resources :companies do
    resources :jobs
    resources :contacts, only: [:create]
  end

  resources :jobs
  resources :categories
  resources :tags
  resources :dashboard, only: [:index]
  resources :contacts, except: [:create]

  resources :jobs, only: [:show] do
    resources :comments, only: [:create]
  end

end
