Gpanda::Application.routes.draw do

  # Sidekiq
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  get "programs/show"

  get "programs/create"

  get "programs/destroy"

  resources :users  
  resources :sessions, :only => [:new, :create, :destroy]
  resources :jobs, :only => [:create, :destroy, :show, :new]
  resources :results

  match 'jobs/update_program_select/:id', :controller => 'jobs', :action => 'update_program_select'
  match 'jobs/update_subprogram_select/:id', :controller => 'jobs', :action => 'update_subprogram_select'


  #match '/submit', :to => 'jobs#create'    
  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/contact', :to => 'pages#contact'
  match '/about', :to => 'pages#about'
  match '/demo', :to => 'pages#demo'
  match '/help', :to => 'pages#help'
  match '/news', :to => 'pages#news'
  match '/jobs', :to => 'jobs#index'

  root :to => 'pages#home'
 
  if Rails.env.development?
    mount ApiTaster::Engine => "/api_taster"
    ApiTaster.routes do

      get '/programs/show', {}

      get '/programs/create', {}

      get '/programs/destroy', {}

      get '/users', {}

      post '/users', {}

      get '/users/new', {}

      get '/users/:id/edit', {}

      get '/users/:id', {}

      put '/users/:id', {}

      delete '/users/:id', {}

      post '/sessions', {}

      get '/sessions/new', {}

      delete '/sessions/:id', {}

      post '/jobs', {
        program: "blast",
        options: "default"
      }

      get '/jobs/:id', {}

      delete '/jobs/:id', {}

      get '/results', {}

      post '/results', {}

      get '/results/new', {}

      get '/results/:id/edit', {}

      get '/results/:id', {}

      put '/results/:id', {}

      delete '/results/:id', {}

    end
  end   

 end
