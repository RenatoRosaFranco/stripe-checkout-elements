# frozen_string_literal: true

Rails.application.routes.draw do

  resources :products, only: [:show]
  post 'create-checkout-session', to: 'checkouts#create'
end
