class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :id_str
      t.string :slug
      t.string :name
      t.string :uri
      t.integer :subscriber_count
      t.string :mode
      t.string :description
      t.string :full_name
      t.string :password_digest

    end
  end
end
