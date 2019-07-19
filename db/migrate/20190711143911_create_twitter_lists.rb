class CreateTwitterLists < ActiveRecord::Migration[5.2]
  def change
    create_table :twitter_lists do |t|
      t.string :list_name
      t.boolean :public, default: true
      t.string :list_description
      t.string :list_members
      t.timestamps
    end
  end
end
