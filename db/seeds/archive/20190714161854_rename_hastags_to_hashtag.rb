class CreateHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtags do |t|
      t.string :keyword
      t.string :list, array:true, default: []
      t.timestamps
    end
  end
end
