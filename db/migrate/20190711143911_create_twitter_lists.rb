class CreateTwitterLists < ActiveRecord::Migration[5.2]
  def change
    create_table :twitter_lists do |t|

      t.timestamps
    end
  end
end
