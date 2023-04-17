Rails.application.routes.draw do

  namespace :admin do
    get 'post_comment/destroy'
  end
  namespace :admin do
    get 'post/show'
  end
  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  get "search" => "searches#search"

  devise_for :users,skip: [:passwords], controllers:{
     registrations: "public/registrations",
     sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'homes/top'
    resources :spot_genres, only:[:index, :edit, :create, :update, :destroy]
    resources :users, only: [:index, :show,]
    get 'users/unsubscribe' => 'users#unsubscribe'
    patch 'users/withdraw' => 'users#withdraw'
    get 'posts/show' => 'posts#show' 
    delete 'post_comment/destroy' => 'post_comments#destroy'
    
  end

  scope module: :public do
    get 'users/user_page' => 'users#user_page', as: 'user'
    get 'users/mypage' => 'users/mypage', as: 'mypage'
    get 'users/information/edit' => 'users#edit', as: 'edit_user'
    patch 'users/information' => 'users#update', as: 'update_user'
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw'
    post 'users/guset_sgin_in', to: "users/sessions#guest_sign_in"

    resources :posts, only: [:new,:index,:create,:destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    get 'posts/travel_post' => 'posts#show'


  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
