Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create]

  resources :products do

    resources :favourites, shallow: true, only: [ :create, :destroy ]

    resources :reviews, shallow: true, only: [ :create, :destroy] do

      resources :likes, only: [:create, :destroy]
      
    end

  end

  get("/admin/panel", to: "welcome#admin_panel", as: :admin_panel)

  get("/home", to: "welcome#home")

  get("/about", to: "welcome#about")

  get("/contact_us", to: "welcome#contact_us")

  get("/", to: "welcome#root")

  post("/process_contact", to: "welcome#process_contact" )

end
