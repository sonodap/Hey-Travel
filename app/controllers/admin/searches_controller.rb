class Admin::SearchesController < ApplicationController
  def search
    @range = params[:range]
    @users = User.where("name LIKE?","%#{params[:word]}%").page(params[:page])
    render 'admin/users/index'
  end
end
