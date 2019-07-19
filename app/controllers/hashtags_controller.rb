class HashtagsController < ApplicationController

  def index
    hashtags = Hashtag.all
    render json: hashtags
  end

  def create
    hashtag = Hashtag.create(params[:hashtag])
  end


  private

  def get_params
    params.require(:hashtag).permit(:keyword)
  end


end
