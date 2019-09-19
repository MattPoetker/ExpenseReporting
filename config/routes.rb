Rails.application.routes.draw do
  resources :organizations
  resources :transactions
  #resources :users
  get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch 'users/:id', to: 'users#update'
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        passwords: 'users/passwords',
        registrations: 'users/registrations',
        confirmations: 'users/confirmations',
        invitations: 'users/invitations',
      }

  devise_for :admins, path: 'admin', path_names: {
      sign_in: 'login', sign_out: 'logout',
      password: 'secret', confirmation: 'verification',
      registration: 'signup', edit: 'edit/profile'
    }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get '/signup', to: 'users/registrations#new', as: 'signup'
    post '/resend', to: 'users/invitations#resend', as: 'resend'
    put 'users' => 'devise/registrations#update'
    resources :users, :only => [:show]
  end

  devise_scope :admin do
    get '/admin/signup', to: 'devise/registrations#new', as: 'admin_signup'
  end
  get '/dashboard' => 'home#index'
  get '/setup', to: 'users#setup', as: 'setup'
  post '/setup', to: 'organizations#create'
  root 'home#index'

end
