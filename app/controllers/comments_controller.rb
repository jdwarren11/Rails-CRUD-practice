class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:video_id], params[:content])
    @comment.save
    redirect_to root_path
  end
end
