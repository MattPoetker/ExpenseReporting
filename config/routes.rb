Rails.application.routes.draw do

  devise_for :users

  resources :transactions

  devise_for :admins, path: 'admin', path_names: {
      sign_in: 'login', sign_out: 'logout',
      password: 'secret', confirmation: 'verification',
      registration: 'signup', edit: 'edit/profile'
    }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  devise_scope :user do
    get '/signup', to: 'devise/registrations#new', as: 'signup'
  end

  devise_scope :admin do
    get '/admin/signup', to: 'devise/registrations#new', as: 'admin_signup'
  end
end
