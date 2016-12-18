Rails.application.routes.draw do
  namespace :admin do
    root "application#index"

    resources :projects, only: %i(new create destroy)
    resources :users do
      member { patch :archive }
    end
    resources :states, only: %i(index new create) do
      member { get :make_default }
    end
  end

  devise_for :users
  root "projects#index"

  resources :projects, only: %i(index show edit update) do
    resources :tickets do
      collection { get :search }
    end
  end

  resources :tickets, only: [] do
    resources :comments, only: :create
    resources :tags, only: [] do
      member { delete :remove }
    end
  end

  resources :attachments, only: %i(show new)
end
