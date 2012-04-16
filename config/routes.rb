ProjectManager::Application.routes.draw do
 

  resources :clients

  devise_for :users do
    get "sign_in", :to => "devise/sessions#new", :as => :sign_in
    get "sign_out", :to => "devise/sessions#destroy", :as => :sign_out
    root :to => "devise/sessions#new"
  end
  
  match 'home' => 'pages#home', :as => :home
  
  resources :projects

end
