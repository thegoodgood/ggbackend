class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :tweets

  has_many :tweets
  # has_many :downvoted_tweets
  has_many :upvoted_tweets
end
