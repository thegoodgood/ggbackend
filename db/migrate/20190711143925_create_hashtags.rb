class CreateHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtags do |t|
      t.string :hastags, array: true, default:[]
      t.timestamps
    end
  end
end
