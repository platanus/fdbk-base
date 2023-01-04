Rails.application.routes.draw do
  root 'app/feedback_sessions#index'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount CoverImageUploader.derivation_endpoint => "/derivations/cover_image"
  mount Sidekiq::Web => '/queue'

  scope module: :app, defaults: { format: :html } do
    resources :feedback_sessions, only: [:show] do
      resources :comments, only: [:new]
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :internal do
      resources :feedback_sessions, only: [:index] do
        resources :comments, only: [:create]
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
