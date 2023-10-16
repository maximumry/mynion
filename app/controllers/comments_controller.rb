class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to opinion_path(@comment.opinion.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, opinion_id: params[:opinion_id])
  end
end
