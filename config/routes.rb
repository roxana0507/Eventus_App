Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :hosts
  devise_for :guests
  
  resources :hosts do
    resources :events do
      resources :menus, except: :create 
      resources :guests
    end
  end
  #delete "events/:id", to: "events#destroy", as: "Destroy"
  get "guest/add", to: "events#assign_guest", as: "assign_guest"
  post  "/hosts/:host_id/events/:event_id/menus", to: "menus#create", as: "create_host_event_menu"

  root to: "events#index"
  #get "/home", to: 'home#index'
  #root to: 'home#index'



  # resources :events do
  #   resources :guests
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
