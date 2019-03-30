Rails.application.routes.draw do
  
  resources :appointments do
	  resources :bookings
	end
  get 'startup/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :resumes, only: [:index, :new, :create, :destroy]


  devise_for :users
  scope "/admin" do
  resources :users
end

  resources :users
  
  resources :topics do
    
  resources :reviews, except: [:show, :index]
  member do
      put "like" => "topics#upvote"
      put "unlike" => "topics#downvote"
end
end 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#index', as: 'home'

  # Example of regular route:
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  get 'news' => 'pages#news'
  get 'show' => 'topics#index'
  get 'pages/send_form' => 'pages#send_form'

  get 'new' => 'booking#new'
end
