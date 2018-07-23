Rails.application.routes.draw do
  root 'home#index'
  get 'about', to: 'about#index'

  #========User Routes ==================#
  get 'signup', to: 'users#new'
  resources :users, except:[:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :articles
  resources :posts
  resources :categories

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
