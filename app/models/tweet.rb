class Tweet < ApplicationRecord
  has_many :votes
  has_many :downvotes
  has_many :upvotes
end
