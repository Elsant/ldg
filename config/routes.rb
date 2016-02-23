Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}
  
  scope controller: :pages do
   get 'index', as: :index
   get 'home', as: :home
  end

  resources :intro

  devise_scope :user do
    get "/login" => "devise/sessions#new"
    authenticated :user do
      root 'pages#home', as: :auth_root
    end
    unauthenticated :user do
      root :to => 'registrations#new', as: :unauth_root
    end
  end
  # root 'pages#index'
  

end
