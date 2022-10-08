# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             },
             defaults: { format: :json }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Health check
  root 'health_check#index'
  get '/health_check', to: 'health_check#index'
  get '/health-check/login', to: 'health_check#login_index'
end
