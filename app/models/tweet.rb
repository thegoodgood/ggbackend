class Tweet < ApplicationRecord
  validates :tweet_id, uniqueness: true

  has_many :votes
  has_many :downvotes
  has_many :upvotes
end
