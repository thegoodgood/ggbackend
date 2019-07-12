class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :name
      t.string :handle
      t.text :content
      t.string :image
      t.date :date
      t.integer :likes
      t.string :category_id
      t.string :integer
      t.integer :list_id

      t.timestamps
    end
  end
end
