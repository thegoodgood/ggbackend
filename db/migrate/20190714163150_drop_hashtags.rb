class DropHashtags < ActiveRecord::Migration[5.2]
  def change
    drop_table:hashtags
  end
end
