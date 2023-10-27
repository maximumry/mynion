class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet

  def create
    like = current_user.likes.build(opinion_id: @opinion.id)
    like.save
    redirect_to root_path
  end

  def destroy
    like = Like.find_by(opinion_id: @opinion.id, user_id: current_user.id)
    like.destroy
    redirect_to root_path
  end

  def set_tweet
    @opinion = Opinion.find(params[:opinion_id])
  end
end
