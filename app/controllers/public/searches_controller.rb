class Public::SearchesController < ApplicationController
  
  before_action :authenticate_admin_or_user!

  def search
    @range = params[:range]
    @posts = Post.includes(:user).where(users: {is_deleted: false}).looks(params[:word]).order(created_at: :desc)
  end
end
