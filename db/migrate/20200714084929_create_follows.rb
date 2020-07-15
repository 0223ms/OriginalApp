class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.integer :following_id, null: false, foreign_key: true
      t.integer :follower_id, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
