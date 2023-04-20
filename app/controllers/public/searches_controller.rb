class Public::SearchesController < ApplicationController
  # before_action :authenticate_user!

  def search
    @range = params[:range]
    @posts = Post.includes(:user).where(users: {is_deleted: false}).looks(params[:word])
  end
end
