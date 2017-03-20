Rails.application.routes.draw do


 # devise_for :users, :skip => [:registrations]
 # as :user do
  #  get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
   # put 'users' => 'devise/registrations#update', :as => 'user_registration'
  #end
  #devise_for :users, controllers: { sessions: 'users/sessions' }
 # devise_scope :user do
  #  get 'sign_in', to: 'devise/sessions#new'
  #end
  #get '/homes/new_user', :to => 'devise/registrations#new', :as => "new_user"
  #get 'create_new', :to => 'devise/registrations#new'
  #devise_scope :users do
   # get '/create', to: 'devise/registrations#new', as: :create
  #end
  root to: "homes#home"
  devise_scope :user do
    get 'create', to: 'devise/registrations#new'
  end


  devise_for :users
  resources :homes
  resources :stocks
  resources :units
  resources :sales
  resources :suppliers
  resources :items
  resources :purchases
  resources :purchase_items
  resources :customers
  resources :user_profiles
  resources :logs
  resources :item_groups
resources :fiscal_years
  resources :company_profiles
  get "/add_fields" => "sales#add_fields"
 # resources :users_admin, :controller => 'users'
  get "/users/sign_up", to: redirect('/404')
  get "/logs/new", to: redirect('/404')

end
