class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :photo, null: false
      t.integer :post_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
