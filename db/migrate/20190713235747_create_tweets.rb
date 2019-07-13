class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :tweet_id
      t.date :created_at
      t.string :land
      t.string :user_name
      t.string :user_profile_id
      t.string :handle
      t.text :content
      t.string :profile_img_url
      t.string :location
      t.integer :favorites
      t.integer :retweets
      t.array :user_mentions
      t.array :urls
      t.array :hashtags
      t.string :media_url
      t.string :media_type
      t.json :tweet_user
      t.json :tweet_entities
      t.json :tweet_extended_entities

      t.timestamps
    end
  end
end
