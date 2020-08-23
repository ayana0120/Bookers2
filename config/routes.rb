Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'devise/sessions',
    registrations: 'devise/registrations'
  }
  authenticated :user do
    root :to => "users#show", :as => "user_authenticated_root"
  end
  root "homes#top"

  get "/home/about" => "homes#about"
  resources :users
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
