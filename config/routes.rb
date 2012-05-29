Blog::Application.routes.draw do      
  
  get "pages/about", as: :about

  resources :posts
  match 'draft' => 'posts#draft', :as => :draft    
  
  match 'login' => 'session#new', :as => :login  
  match 'logout' => 'session#destroy', :as => :logout
  resources :session, only: [:create]
  
  match 'rss.xml' => 'rss#show', as: :rss
  
  match ':id/*year/*month/*day/*title' => 'posts#show', as: :nice_post
    
  root to: "home#index"
  
end
