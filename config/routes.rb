require 'api_version_control'

Rails.application.routes.draw do
  resources :todo_lists
  resources :projects
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "projects#index"

  namespace :api, defaults: { format: :json }, path: '/' do
    namespace :v1, path: "/v1", constraints: ApiVersionControl.new(version: 1, default: true) do
      resources :users, only: [:index]
      resources :sessions, only: [:create, :destroy]
      resources :projects, only: [:index] do
        resources :todo_lists, only: [:index, :update, :show]
      end
    end
  end
end
