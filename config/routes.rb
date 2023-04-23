Rails.application.routes.draw do

  namespace :admin do
    get 'search/search'
  end
  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  devise_for :users,skip: [:passwords], controllers:{
     registrations: "public/registrations",
     sessions: 'public/sessions'
  }

  devise_scope :user do
    post 'users/guset_sgin_in' => "public/sessions#guest_sign_in"
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'homes/top'
    resources :spot_genres, only:[:index, :edit, :create, :update, :destroy]
    get 'users/unsubscribe' => 'users#unsubscribe'
    resources :users, only: [:index, :show,]
    get 'posts/show' => 'posts#show'
    resources :posts, only: [:destroy]
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw'
    delete 'post_comment/destroy/:post_id/:id' => 'post_comments#destroy', as: 'post_comment_destroy'
    get "search" => "searches#search"

  end

  scope module: :public do
    get 'users/user_page' => 'users#user_page', as: 'user'
    get 'users/mypage' => 'users/mypage', as: 'mypage'
    get 'users/information/edit' => 'users#edit', as: 'edit_user'
    patch 'users/information' => 'users#update', as: 'update_user'
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw'
    get "users/:id/favorites" => "users#favorites",as: "user_favorites"
    get "search" => "searches#search"

    resources :posts, only: [:new,:index,:create,:destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    get 'posts/travel_post' => 'posts#show'


  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
