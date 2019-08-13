class AddEntitiesAndExtendedEntitiesToTweetsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :entities, :string
    add_column :tweets, :extended_entities, :string
  end
end
