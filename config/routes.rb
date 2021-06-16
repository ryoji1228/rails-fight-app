Rails.application.routes.draw do
  
  get "/sports", to: "sports#index"
  post "/sports", to: "sports#create"
  get "/sports/new", to: "sports#new" , as: "new_sport"
  get "/sports/:id/edit", to: "sports#edit", as: "edit_sport"
  get "/sports/:id", to: "sports#show", as: "sport"
  patch "/sports/:id", to: "sports#update"
  delete "/sports/:id", to: "sports#destroy"
  
  devise_for :views
  devise_for :users
  root to: 'sports#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
