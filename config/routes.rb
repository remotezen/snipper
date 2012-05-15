Snipper::Application.routes.draw do

  get "static_pages/home"
  get "static_pages/about"
  get "static_pages/contact"
  get "users/show"
  match '/help', :to => "static_pages#help"
  match '/contact', :to => "static_pages#contact"
  match '/about', :to => "static_pages#about"
  get "static_pages/help"
  match "/profile/:id", :to => "users#show", :as => "profile"
  get "users/index"
  match "/remove/:id", :to => "users#destroy", as: "remove"
  resources :microposts, only: [ :create, :destroy]
  resources :relationships, only: [ :create, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  

  #match '/show/'
  devise_for :users
  devise_scope :user do
    match '/signin', :to => "devise/sessions#new"
    match '/signup', :to =>"devise/registrations#new"
    match '/signout', :to => "devise/sessions#destroy"
    match '/user_edit/:id', :to=> "devise/registrations#edit",  as:"user_edit"
  end
  

  root :to => "static_pages#home"
end
