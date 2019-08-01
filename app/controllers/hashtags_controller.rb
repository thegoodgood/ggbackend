class HashtagsController < ApplicationController
skip_before_action :authorized, only: [:create, :new, :index]

  def index
    hashtags = Hashtag.all
    render json: hashtags
  end

  def create
    hashtag = Hashtag.create(params[:hashtag])
  end



  def show
      hashtag = Hashtag.find(params[id])
      twitter_client = TwitterApi.new
      tweets = twitter_client.get_tweets_from_hashtag(hashtag.name)
      render json: tweets
  end

  private

  def get_params
    params.require(:hashtag).permit(:keyword)
  end


end
