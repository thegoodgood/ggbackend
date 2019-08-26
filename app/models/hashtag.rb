class Hashtag < ApplicationRecord
  validates :keyword, uniqueness: true
end
