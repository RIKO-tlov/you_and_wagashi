Rails.application.routes.draw do

  #管理者側
  namespace :admin do
    root to: "homes#top"
    resources :shops, only: [:show, :destroy] do
      resources :reviews, only: [:index, :destroy]
    end
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
  end

  #ユーザー側
  scope module: :public do
    root to: 'homes#top'
    get "/about" => "homes#about", as: "about"
    resources :users, only: [:edit, :update, :destroy]
    get "/users/my_page" => "users#show"
    get "users/visit" => "users#visit"
    get "users/wish" => "users#wish"
    get "users/review" => "users#review"
    resources :shops do
      resources :reviews #showアクションいるかどうか検討中
      resource :visits, only: [:create, :destroy]
      resource :wishes, only: [:create, :destroy]
    end
  end

  devise_for :users, :controllers => {
    sessions: "public/sessions",
    passwords: "public/passwords",
    registrations: "public/registrations"
  }

end
