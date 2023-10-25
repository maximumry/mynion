class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet

  def create
    like = current_user.likes.build(opinion_id: @opinion.id)
    like.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    like = Like.find_by(opinion_id: @opinion.id, user_id: current_user.id)
    like.destroy
    respond_to do |format|
      format.js
    end
  end

  def set_tweet
    @opinion = Opinion.find(params[:opinion_id])
  end
end
