class UpvoteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :tweet_id

end
