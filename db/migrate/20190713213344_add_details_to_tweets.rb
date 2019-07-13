class AddDetailsToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :tweet_id, :string
    add_column :tweets, :profile_image_url, :string
  end
end
