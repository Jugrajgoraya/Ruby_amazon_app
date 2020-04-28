Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create]

  resources :products do

    resources :reviews, only: [ :create, :destroy]

  end

  get("/home", to: "welcome#home")

  get("/about", to: "welcome#about")

  get("/contact_us", to: "welcome#contact_us")

  get("/", to: "welcome#root")

  post("/process_contact", to: "welcome#process_contact" )

end
