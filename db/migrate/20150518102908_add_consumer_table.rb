class AddConsumerTable < ActiveRecord::Migration
  def change
    create_table :consumers do |t|
      t.integer :user_id,    null: false
      t.string  :last_name, null: false
      t.string  :first_name, null: false
      t.string  :middle_name
      t.string  :title
      t.string  :prefix
      t.string  :suffix
      t.string  :gender
      t.timestamps null: false
    end
  end
end
