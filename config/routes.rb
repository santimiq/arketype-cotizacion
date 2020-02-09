Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'quotations#index'
  resources :quotations, :path => 'cotizacion', param: :slug
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
