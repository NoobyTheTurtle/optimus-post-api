# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :districts, only: :index
      resources :areas, only: :show
    end
  end

  if Rails.env.development?
    mount Sidekiq::Web => '/sidekiq'
    mount Rswag::Ui::Engine => '/api-docs'
    mount Rswag::Api::Engine => '/api-docs'
  end
end
