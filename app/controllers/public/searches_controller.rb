class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    # if @range == "User"
      @posts = Post.looks(params[:word])
    # end
  end
end
