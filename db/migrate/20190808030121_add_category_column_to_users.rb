class AddCategoryColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :topic, :string
  end
end
