class OpinionsController < ApplicationController
  before_action :authenticate_user, except: :index
  def index
  end

  def new
    @opinion = Opinion.new
  end
end
