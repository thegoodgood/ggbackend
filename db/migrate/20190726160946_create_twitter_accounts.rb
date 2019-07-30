class CreateTwitterAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :twitter_accounts do |t|
        t.string :name
        t.string :screen_name
        t.string :topic

      t.timestamps
    end
  end
end
