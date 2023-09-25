Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_for :admins, controllers: {
        sessions: 'api/v1/sessions',
        registrations: 'api/v1/registrations',
        password_resets: 'api/v1/password_resets'
      }
      resources :registrations, only: [:index, :create]
      resources :sessions, only: [:create, :destroy]
      resources :companies
      resources :departments
      resources :locations
      resources :profiles
      resources :asset
      # resources :products
      resources :countries
      resources :states
      resources :cities
      resources :vendors
      resources :total_vendors
      resources :total_employees
      resources :total_assets
      resources :notifications
      resources :asset_specifications
      resources :purchase_types
      resources :assign_assets
      resources :totalcost_assets
      get 'productcategories',to: 'productcategories#index'
      get 'producttype',to: 'producttype#index'
      post 'product/create', to: 'product#create'
      get 'products', to: 'product#index'
      delete 'product/destroy/:id', to: 'product#destroy'
      put 'product/:id', to: 'product#update'
      get 'products/:id', to: 'product#show'
      get 'vendors/total_count', to: 'vendors#total_count'
      delete 'logout', to: 'sessions#destroy'
      get "password_resets", to: 'password_resets#index'
      get 'employee', to: 'employee#index'
      get 'employee/:id', to: 'employee#show'
      post 'employees', to: 'employee#create'
      put 'employee/:id', to: 'employee#update'
      put 'location/:id', to: 'location#update'
      get 'location/:id', to: 'location#show'
      get 'employee/total_count', to: 'employee#total_count'
      get 'employee/total_count', to: 'employee#total_count'
      post "password_resets_update", to: 'api/v1/password_resets#update'
      post 'password_resets', to: 'password_resets#create'
      get 'password_resets_edit', to: 'password_resets#edit'
      patch 'password_resets_update', to: 'password_resets#update'
      resources :logo_company
    end
  end
end