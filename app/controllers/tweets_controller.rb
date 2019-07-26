class TweetsController < ApplicationController

  def new
    twitter_api = ApiTwitter.new
    tweets_from_api = twitter_api.home_line
  end

  def index
    tweets = Tweet.all
    render json: tweets
  end



  # def show
  #   @tweet = Tweet.find(params[:id])
  #     format.json {render json @article }
  #
  # end

# To remove the root node in json file
  # def default_serializer_options
  #   {root: false}
  # end

  # private
  #
  # def tweets_params
end
