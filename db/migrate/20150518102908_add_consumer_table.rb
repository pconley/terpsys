class AddConsumerTable < ActiveRecord::Migration
  def change
    create_table :consumers do |t|
      t.integer :user_id,    null: false
      t.string  :last_name,  null: false
      t.string  :first_name, null: false
      t.string  :gender,     null: false
      t.string  :address

      t.timestamps null: false
    end
  end
end
