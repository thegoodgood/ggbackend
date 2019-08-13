class TweetSerializer < ActiveModel::Serializer
  attributes :id, :tweet_id, :created_at, :user_name,:handle, :content, :profile_img_url, :location, :upvotes, :downvotes, :topic, :hashtags, :urls, :media, :entities, :extended_entities_obj, :media_obj, :url_obj
  def upvotes
    tweet = self.object
    tweet.upvotes.count
  end

  def downvotes
    tweet = self.object
    tweet.downvotes.count
  end

  def media_obj
    tweet = self.object
    if tweet["media"]
      JSON.parse(tweet["media"][0].gsub('=>', ':'))
    end
  end

  def url_obj
    tweet = self.object
    if !tweet["urls"].empty?
      JSON.parse(tweet["urls"][0].gsub('=>', ':'))
    end
  end

  def extended_entities_obj
    tweet = self.object
    if !tweet["extended_entities"].empty?
      binding.pry
      JSON.parse(tweet["extended_entities"].gsub('=>', ':'))
    end
  end

end
