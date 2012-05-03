ProjectManager::Application.routes.draw do

  resources :clients
  resources :comments
  

  devise_for :users do
    get "sign_in", :to => "devise/sessions#new", :as => :sign_in
    get "sign_out", :to => "devise/sessions#destroy", :as => :sign_out
    root :to => "devise/sessions#new"
  end
  
  match 'home' => 'pages#home', :as => :home
  
  resources :projects do
    collection do
      get '/internal', :action => :internal, :as => :internal
      get '/external', :action => :external, :as => :external
    end
  end
  resources :prospects do
    collection do
      get "/status/:status", :action => :filter_by_status, :as => :filter_by_status
    end
  end
  resources :suppliers
  resources :business_units, :only => :index
  resources :users
  resources :employees do
    collection do
      get "/status/:status", :action => :filter_by_status, :as => :filter_by_status
    end
  end
  
end
