Rails.application.routes.draw do
  get 'calendars/new'

  get 'calendars/create'

  get 'calendars/update'

  get 'locations/new'

  get 'locations/create'

  get 'locations/edit'

  get 'locations/update'

  get 'photos/new'

  get 'photos/create'

  get 'password_resets/new'

  get 'password_resets/edit'

  root                'static_pages#home'
  get 'help'    	=>	'static_pages#help'
  get 'about'   	=>	'static_pages#about'
  get 'contact' 	=> 	'static_pages#contact'
  get 'signup'	  =>	'users#new'
  get 'login'	    =>	'sessions#new'
  post 'login'	  =>	'sessions#create'
  delete 'logout'	=>	'sessions#destroy'

  get 'dashboard' => 'users#dashboard'
  get 'rack'      => 'items#index'
  get 'reservations' => 'reservations#show'
  get 'account'   => 'users#account'
  get 'rackit'    => 'items#new'
  post 'rackit'    => 'items#create'



  get 'items/:id/photos' => 'photos#show', as: :edit_photos
  delete 'items/:id/photos' => 'photos#destroy', as: :delete_photo

  get 'item/:id/location' => 'locations#new', as: :item_location

  get 'items/:id/edit' => 'items#edit'
  patch 'items/:id/edit' => 'items#update'

  get 'items/:id/calendar' => 'calendars#new', as: :item_calendar
  post 'items/:id/calendar' => 'calendars#create'



  resources :items, only: [:new, :create, :destroy, :edit, :update, :update_calendar]
  resources :users
  resources :locations
  resources :calendars
  resources :photos 
  resources :reservations
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :picture_contents, only: [:create]
end
