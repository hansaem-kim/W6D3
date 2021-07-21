class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false 

      t.timestamps
    end

    add_index :users, :name 
    add_index :users, :email 
  end
end