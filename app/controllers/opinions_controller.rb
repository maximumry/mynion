class OpinionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @opinions = Opinion.includes(:user).order("created_at DESC")
  end

  def new
    @opinion = Opinion.new
  end

  def create
    opinion = Opinion.new(set_opinion)
    opinion.save
    redirect_to root_path
  end

  def show
    @opinion = Opinion.find(params[:id])
    @comment = Comment.new
    @comments = @opinion.comments.includes(:user)
  end

  private
    def set_opinion
      params.require(:opinion).permit(:title, :text, :image).merge(user_id: current_user.id)
    end
end
