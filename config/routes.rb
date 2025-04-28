Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :admin do
    resources :albums
    resources :news_items
    resources :songs

    root to: "albums#index"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :albums, only: [:index, :show] do
    resources :songs, only: [:index, :show, :update]
  end
  resources :news_items, only: [:index, :show]
  post "send_email", to: "send_email#new"
  get "photos", to: "photos#index"
  get "blog_posts", to: "blog_posts#index"
  get "blog_posts/:path", to: "blog_posts#show"
end
