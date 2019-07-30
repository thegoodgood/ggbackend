require 'byebug'
class TweetsController < ApplicationController
skip_before_action :authorized, only: [:create, :new, :index, :list, :sc_tweets]

  def index
    tweets = Tweet.order("created_at DESC")
    render json: tweets
  end

  def list
    tweets_from_list = ApiTwitter.timeline
    new_tweets = tweets_from_list.map do |tweet|
      if !Tweet.find_by(tweet_id: tweet['id_str'])
        Tweet.create(
          tweet_id: tweet['id_str'],
          created_at: tweet['created_at'],
          lang: tweet['user']['lang'],
          user_name: tweet['user']['name'],
          user_profile_id: tweet['user']['id_str'],
          handle:tweet['user']['screen_name'],
          content:tweet['text'],
          profile_img_url: tweet["user"]["profile_image_url_https"],
          location: tweet['user']['location'],
          favorites:tweet['user']['favorite_count'],
          retweets: tweet['user']['retweet_count'],
          user_mentions:tweet['entities']['user_mentions'],
          urls: tweet['entities']['urls'],
          hashtags: tweet['entities']['hashtags'],
          media: tweet['entities']['media']
        )
      end
    end
    render json: new_tweets
  end



  def sc_tweets

    tweets_from_list = ApiTwitter.sc_tweets
    new_sc_tweets = tweets_from_list.map do |tweet|
      if !Tweet.find_by(tweet_id: tweet['id_str'])
        Tweet.create(
          tweet_id: tweet['id_str'],
          created_at: tweet['created_at'],
          lang: tweet['user']['lang'],
          user_name: tweet['user']['name'],
          user_profile_id: tweet['user']['id_str'],
          handle:tweet['user']['screen_name'],
          content:tweet['text'],
          profile_img_url: tweet["user"]["profile_image_url_https"],
          location: tweet['user']['location'],
          favorites:tweet['user']['favorite_count'],
          retweets: tweet['user']['retweet_count'],
          user_mentions:tweet['entities']['user_mentions'],
          urls: tweet['entities']['urls'],
          hashtags: tweet['entities']['hashtags'],
          media: tweet['entities']['media']
        )
      else
        Tweet.find_by(tweet_id: tweet['id_str'])
      end

    end
    render json: new_sc_tweets
  end

  def new
    tweets_from_api = ApiTwitter.timeline
    new_timeline = tweets_from_api.map do |tweet|
      if !Tweet.where(tweet_id: tweet['id_str'])
        Tweet.create(
          tweet_id: tweet['id_str'],
          created_at: tweet['created_at'],
          lang: tweet['user']['lang'],
          user_name: tweet['user']['name'],
          user_profile_id: tweet['user']['id_str'],
          handle:tweet['user']['screen_name'],
          content:tweet['text'],
          profile_img_url: tweet["user"]["profile_image_url_https"],
          location: tweet['user']['location'],
          favorites:tweet['user']['favorite_count'],
          retweets: tweet['user']['retweet_count'],
          user_mentions:tweet['entities']['user_mentions'],
          urls: tweet['entities']['urls'],
          hashtags: tweet['entities']['hashtags'],
          media: tweet['entities']['media']
        )
      end
    end
    render json: new_timeline
  end




end
