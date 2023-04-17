class Admin::PostCommentController < ApplicationController
  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to admin_posts_show_path(params[:post_id])
  end
end
