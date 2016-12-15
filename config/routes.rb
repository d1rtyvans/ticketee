Rails.application.routes.draw do
  namespace :admin do
    root "application#index"

    resources :projects, only: %i(new create destroy)
    resources :users do
      member do
        patch :archive
      end
    end
    resources :states, only: %i(index new create)
  end

  devise_for :users
  root "projects#index"

  resources :projects, only: %i(index show edit update) do
    resources :tickets
  end

  resources :tickets, only: [] do
    resources :comments, only: :create
  end

  resources :attachments, only: %i(show new)
end
