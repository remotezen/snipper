Snipper::Application.routes.draw do
  get "static_pages/home"
  get "static_pages/about"
  get "static_pages/contact"
  match '/help', :to => "static_pages#help"
  match '/contact', :to => "static_pages#contact"
  match '/about', :to => "static_pages#about"


  get "static_pages/help"

  devise_for :users

  

  root :to => "static_pages#home"
end
