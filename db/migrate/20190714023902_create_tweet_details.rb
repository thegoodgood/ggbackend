class CreateTweetDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :tweet_details do |t|
      t.string :tweet_id
      t.jsonb :tweet_user
      t.jsonb :tweet_entities
      t.jsonb :tweet_extended_entities

      t.timestamps
    end
  end
end
