class ChangeHashtagsHashtag < ActiveRecord::Migration[5.2]
    def change
      change_column :hashtags, :hashtag, :string, array: false
    end
  end
