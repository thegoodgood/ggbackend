class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :handle
      t.string :city

      t.timestamps
    end
  end
end
