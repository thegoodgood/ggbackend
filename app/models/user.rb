class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
  has_many :votes
  has_many :tweets, through: :votes

  has_many :upvotes
  has_many :downvotes
  has_many :downvoted_tweets, through: :downvotes, source: :tweet
  has_many :upvoted_tweets, through: :upvotes, source: :tweet

end
