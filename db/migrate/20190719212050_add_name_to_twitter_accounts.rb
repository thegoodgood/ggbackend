class AddNameToTwitterAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :twitter_accounts, :name, :string
  end
end
