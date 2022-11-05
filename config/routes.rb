# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :districts, only: %i[index show] do
        resources :areas, only: :index
      end
      resources :placement_object_types, only: :index
      resources :automatic_post_offices, only: %i[index show] do
        get :export_xlsx, on: :collection
      end
      resources :areas, only: :show
    end
  end

  mount Sidekiq::Web => '/sidekiq'
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
end
