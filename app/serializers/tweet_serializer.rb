class TweetSerializer < ActiveModel::Serializer
  attributes :tweet_id, :created_at, :lang, :user_name, :user_profile_id, :handle, :content, :profile_img_url, :location , :favorites , :retweets, :user_mentions, :urls, :hashtags, :media


  def index
    tweets = Tweet.all
    render json: tweets
  end


# customize url attribute for the tweet
  # def url
  #   tweet_url(object)
  # end

  # def attributes
  #   # goal is to add the tweet's twitter URL to the tweet object so that users can click on a tweet and pull that tweet;s info from twitter via embed
  #   data = super
  #   data[:edit_url] = edit_article_url(object)
  # end
end
