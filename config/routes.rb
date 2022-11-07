# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :districts, only: %i[index show] do
        resources :areas, only: :index
      end
      resources :placement_object_types, only: :index
      post :automatic_post_offices, to: 'automatic_post_offices#index'
      resources :automatic_post_offices, only: :show do
        post :export_xlsx, on: :collection
      end
      resources :areas, only: :show
      resources :users, only: %i[] do
        post :login, on: :collection
      end
    end
  end

  mount Sidekiq::Web => '/sidekiq'
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
end
