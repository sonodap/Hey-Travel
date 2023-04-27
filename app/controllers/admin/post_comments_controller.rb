class Admin::PostCommentsController < ApplicationController
   before_action :authenticate_admin!
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to admin_posts_show_path(id: params[:post_id])
  end
end
