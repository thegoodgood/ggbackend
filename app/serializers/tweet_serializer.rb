class TweetSerializer < ActiveModel::Serializer
  attributes :id, :tweet_id, :created_at, :user_name,:handle, :content, :profile_img_url, :location, :upvotes, :downvotes, :topic, :hashtags, :urls, :url_obj, :media, :media_obj, :entities, :entities_obj, :extended_entities, :extended_entities_obj
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

  def entities_obj
    tweet = self.object
    if tweet["entities"] && !tweet["entities"].empty?
      JSON.parse(tweet["entities"].gsub('=>', ':'))
    end
  end

#   def extended_entities
#     tweet = self.object
#     if tweet["extended_entities"] && !tweet["extended_entities"].empty?
# # binding.pry
#       tweet = [tweet["extended_entities"].gsub('=>', ':')][0]
#       JSON.parse(tweet.to_json)
#     end
#   end

  def extended_entities_obj
    tweet = self.object
    if tweet["extended_entities"] && !tweet["extended_entities"].empty?
      # binding.pry
      extended_entities = tweet["extended_entities"].gsub('=>', ':').gsub('nil', 'false')
      if !extended_entities.empty?
        # ee = extended_entities.gsub('=>', ':')
        JSON.parse(extended_entities)
      end
    end
  end

end
