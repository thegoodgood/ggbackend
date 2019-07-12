class TweetsController < ApplicationController

  def index
    # tweets = Tweet.all
    twitter_api = ApiTwitter.new
    tweets_from_api = twitter_api.home_line

    tweets_from_app = tweets_from_api.map do |tweet|
      Tweet.new()
    end

    render json: tweets_from_app
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
