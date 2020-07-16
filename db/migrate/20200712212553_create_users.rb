class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :nickname, null: false
      t.string :email, null: false 
      t.string :phonenumber, null: false
      t.string :password, null: false
      t.string :gender
      t.text :text
      t.string :image, defaule: ""
      t.timestamps
    end
    add_index :users, :username,   unique: true
  end
end
