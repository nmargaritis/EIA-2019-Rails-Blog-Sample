Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles
  resources :authors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  match '*path' => redirect('/'), via: :get
end
