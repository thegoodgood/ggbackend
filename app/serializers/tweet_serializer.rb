class TweetSerializer < ActiveModel::Serializer
  attributes :id, :tweet_id, :created_at, :user_name,:handle, :content, :profile_img_url, :location, :upvotes, :downvotes, :topic, :hashtags, :urls, :display_url, :media

  def upvotes
    tweet = self.object
    tweet.upvotes.count
  end

  def downvotes
    tweet = self.object
    tweet.downvotes.count
  end

  def display_url
    tweet= self.object
    tweet["urls"][0]["display_url"]
  end

end
