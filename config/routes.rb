require "#{Rails.root}/lib/cities_rack_app"

Rails.application.routes.draw do
  devise_for :users
  get "notes/index"
  get "notes/show"
  get "notes/new"

  # get "cities/index"
  
  resources :letters


  
  get 'demo_form', to: 'demo#form'
  get  'form_result', to: 'demo#result'



  # get "cars/index"  
  # get "feedback/new"
  # get "feedback/create"
  # get "feedback/success"
  # get "users/new"
  # get "users/create"
  # get "users/show"

resources :feedbacks, only: [:new, :create] do
collection do
    get "success"
  end
  end

root to: "cities#index"
  # namespace :admin  do 
  #   root to: "notes#index"
  #   resources  :notes
  # end

  
  resources :users 

  # resources :cities do 
  #       resources :places
  # end 
  
  resources :cities do 
    member do 
patch  :attach_kit
delete :delete_image_attachment
get :download_logo
get :check_file_data
    end
  end
  


# non- resources routes 

match "/cities/rack", to: CitiesRackApp, via: :all

# get "શહેરો", to: "cities#index"

# get "/cities", to: "cities#index"

# direct :cities_home do 
#   "/cities"
# end

# direct :cities_main do
#   { controller: "cities", action: "index", subdomain: "www"}
# end




# get "*pages",  to: "cities#pages",  format: false 
# match "/cities",          to: "cities#index",   via: :get,    as: :cities
# match "/cities/new",      to: "cities#new",     via: :get,    as: :new_city
# match "/cities",          to: "cities#create",  via: :post
# match "/cities/:id",      to: "cities#show", via: :get, as: :city
# get "/:username", to: "users#show"
# get "/cities/:id",to: "cities#show",  id: /[A-Z]\d{5}/
# match "/cities/:id/edit", to: "cities#edit",    via: :get,    as: :edit_city
# match "/cities/:id",    to: "cities#update",  via: :patch
# match "/cities/:id",    to: "cities#destroy", via: :delete

#  wild card segmet routes 

# get "cities/*other", to: "cities#unknown"
# get "cities/*area/:name", to: "cities#area"
# get "cities/*a/foo/*b", to: "cities#foo"


# constraint subdomain routes   
# constraints subdomain: "admin" do 
#   reosurces :cities 
# end

#Ex:- :default =>''


#  resources :cities do 
#    resources :places do
#      resources :notes 
#    end
  # end
 
  # resources :cities  do 
  #   resources :notes, only:[:index, :new]
  # end 
  #  resources :places, only:[:show]
  

# scope shallow_prefix: "sekret" do
#   resources :cities do 
#     resources :notes, shallow: true 
#   end
# end

# resources :cities do 
#   resources :entries 
# end
  
# concern :entryable do
#   resources :entries, shallow: true
# end

# resources :cities, concerns: :entryable

post "debug_params", to: "places#debug_params"
post "places/upload", to: "places#upload", as: :upload_places

resources :places

# resources :users, only: [:new, :create, :show]

resources :cars, only: [:index]

resources :users do
  member do 
    get :send_report
  end
end

resources :notes


# resources :profiles 


# redirect routes 

# get "/cities" , to: redirect("/places")
# get "/cities/new" , to: redirect("/places/new")


# scope "/admin" do 
# resources :notes, as: "admin_notes"
# end

# scope(path_names: { new: "neu", edit: "bearbeiten" }) do
#   resources :notes, path: "kategorien"
# end


# resources :notes, module: "admin"

resource :geocoder
resolve("Geocoder") { [:geocoder] }


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index" 
end