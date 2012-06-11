ProjectManager::Application.routes.draw do

  resources :clients do
    collection do
      get "/software", :action => :interested_in_software, :as => :interested_in_software
      get "/graphic_design", :action => :interested_in_graphic_design, :as => :interested_in_graphic_design
      get "/industrial_design", :action => :interested_in_industrial_design, :as => :interested_in_industrial_design
      get "/business_planning", :action => :interested_in_business_planning, :as => :interested_in_business_planning
      get "/research_and_development", :action => :interested_in_research_and_development, :as => :interested_in_research_and_development
      get '/by_date_range', :action => :by_date_range, :as => :by_date_range
    end
  end
  resources :comments
  

  devise_for :users do
    get "sign_in", :to => "devise/sessions#new", :as => :sign_in
    get "sign_out", :to => "devise/sessions#destroy", :as => :sign_out
    root :to => "devise/sessions#new"
  end
  
  match 'home' => 'pages#home', :as => :home
  
  resources :archives, :only => :destroy
  
  resources :projects do
    resources :archives, :only => [:create]
    collection do
      get '/internal', :action => :internal, :as => :internal
      get '/external', :action => :external, :as => :external
      get '/by_date_range', :action => :by_date_range, :as => :by_date_range
      get "/status/:status", :action => :filter_by_status, :as => :filter_by_status
    end
  end
  resources :prospects do
    collection do
      get "/status/:status", :action => :filter_by_status, :as => :filter_by_status
      get "/software", :action => :interested_in_software, :as => :interested_in_software
      get "/graphic_design", :action => :interested_in_graphic_design, :as => :interested_in_graphic_design
      get "/industrial_design", :action => :interested_in_industrial_design, :as => :interested_in_industrial_design
      get "/business_planning", :action => :interested_in_business_planning, :as => :interested_in_business_planning
      get "/research_and_development", :action => :interested_in_research_and_development, :as => :interested_in_research_and_development
      get '/by_date_range', :action => :by_date_range, :as => :by_date_range
    end
  end
  resources :suppliers
  resources :business_units, :only => :index
  resources :users do
    resources :projects, :only => :index
  end
  resources :employees do
    collection do
      get "/status/:status", :action => :filter_by_status, :as => :filter_by_status
      get '/male', :action => :male, :as => :male
      get '/female', :action => :female, :as => :female
    end
  end
  
end
