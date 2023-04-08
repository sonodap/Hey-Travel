Rails.application.routes.draw do
  devise_for :spot_genres
  devise_for :favorites
  devise_for :post_comments
  devise_for :posts
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
