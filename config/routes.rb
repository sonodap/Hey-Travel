Rails.application.routes.draw do
  get 'homes/top'
  get 'homes/about'
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
    resources :spot_genres, only:[:index, :edit, :create, :update]
    resources :users, only: [:index, :show,]
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'admin_unsubscribe'
    patch 'users/withdraw' => 'users#withdraw', as: 'admin_withdraw'
    delete 'admin/post_comment/destroy' => 'admin/post_comments#destroy', as: 'admin_destroy_comment'
  end

  scope module: :public do
    post 'users/my_page' => 'users#show', as: 'user'
    get 'users/information/edit' => 'users#edit', as: 'edit_user'
    patch 'users/information' => 'users#update', as: 'update_user'
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw'

    resources :posts, only: [:index,:create,:destroy,:update]
    post 'posts/my_post' => 'posts#show'
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
