Rails.application.routes.draw do
  resources :organizations
  resources :transactions
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
