Snipper::Application.routes.draw do
  get "static_pages/home"

  get "static_pages/help"

  devise_for :users
  

  root :to => "home#index"
end
