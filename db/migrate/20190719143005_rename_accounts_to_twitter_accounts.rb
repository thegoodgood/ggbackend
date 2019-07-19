class RenameAccountsToTwitterAccounts < ActiveRecord::Migration[5.2]
  def change
    rename_table :accounts, :twitter_accounts
  end
end
