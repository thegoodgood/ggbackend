class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :tweet_id
      t.date :created_at
      t.string :lang
      t.string :user_name
      t.string :user_profile_id
      t.string :handle
      t.text :content
      t.string :profile_img_url
      t.string :location
      t.integer :favorites
      t.integer :retweets
      t.string :user_mentions, array: true, default: []
      t.string :urls, array: true, default: []
      t.string :hashtags, array: true, default: []
      t.string :media, array: true, default: []

      t.timestamps
    end
  end
end
