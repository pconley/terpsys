class AddInterpreter < ActiveRecord::Migration
  def change
    create_table :interpreters do |t|
      t.integer :user_id, null: false
      t.string  :skill_level, null: false
      t.integer :hourly_rate, null: false
      t.string  :payment_address
      t.string  :payment_account

      t.timestamps null: false
    end
    
  end
end
