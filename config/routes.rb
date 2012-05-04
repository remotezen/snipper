Snipper::Application.routes.draw do
  get "users/show"

  get "users/index"

  get "static_pages/home"
  get "static_pages/about"
  get "static_pages/contact"
  match '/help', :to => "static_pages#help"
  match '/contact', :to => "static_pages#contact"
  match '/about', :to => "static_pages#about"
  get "static_pages/help"
  match "/profile/:id", :to => "users#show", as: "profile"
  

  #match '/show/'
  devise_for :users
  devise_scope :user do
    match '/signin', :to => "devise/sessions#new"
    match '/signup', :to =>"devise/registrations#new"
  end
  

  root :to => "static_pages#home"
end
