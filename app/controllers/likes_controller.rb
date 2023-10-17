class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet

  def create
    like = current_user.likes.build(opinion_id: params[:opinion_id])
    like.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    like = Like.find_by(opinion_id: params[:opinion_id], user_id: current_user.id)
    like.destroy
    respond_to do |format|
      format.js
    end
  end

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
