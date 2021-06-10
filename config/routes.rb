Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
    sessions: 'admin/sessions'
  }
  
  devise_for :users, :controllers => {
    sessions: "public/sessions",
    registrations: "public/registrations"
  }

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
    get "/ranking" => "shops#ranking", as: "ranking"
    resources :users, only: [:show, :edit, :update, :destroy] do
      collection do
        get :visits
        get :wishes
      end
    end
    resources :shops do
      resources :reviews, except: [:index, :show]
      resource :visits, only: [:create, :destroy]
      resource :wishes, only: [:create, :destroy]
    end
  end

end
