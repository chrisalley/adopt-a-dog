Adoptadog::Application.routes.draw do

  get "log-in" => "sessions#new", :as => :log_in  
  get "log-out" => "sessions#destroy", :as => :log_out
  get "register" => "users#new", :as => :register
  resources :users
  resources :sessions
  resources :messages
  match '/contact' => 'messages#new'
  resources :questions, :path => 'faqs'
  resources :news_entries, :path => 'news-and-events'
  resources :dogs, :path => 'dogs-for-adoption'
  resources :happy_tails, :path => 'happy-tails'
  resources :pages
  match '/:id' => 'pages#show'
  root :to => "home#index"
  
end
