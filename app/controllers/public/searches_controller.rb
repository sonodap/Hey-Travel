class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    if @range == "User"
      @posts = Pook.looks(params[:search], params[:word])
    end
  end
end
