class RenameHastagsToHashtag < ActiveRecord::Migration[5.2]
  def change
    rename_column :hashtags, :hastags, :hashtag
  end
end
