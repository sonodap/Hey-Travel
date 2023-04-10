Rails.application.routes.draw do
  namespace :admin do
    get 'spot_genres/index'
    get 'spot_genres/edit'
  end
  namespace :admin do
    get 'users/show'
    get 'users/index'
    get 'users/unsubscribe'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/unsubscribe'
  end
  namespace :public do
    get 'posts/new'
    get 'posts/create'
    get 'posts/imdex'
    get 'posts/show'
    get 'posts/destroy'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :users,skip: [:passwords], controllers:{
     registrations: "public/registrations",
     sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
