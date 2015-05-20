class AddInterpreter < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string  :phone_type
      t.string  :number, null: false
      t.integer :phoneable_id
      t.string  :phoneable_type      
      t.timestamps null: false
    end
    add_index :phones, :phoneable_id
    create_table :addresses do |t|
      t.string  :address_type
      t.string  :attention
      t.string  :street1, null: false
      t.string  :street2
      t.string  :city,  null: false
      t.string  :state, null: false
      t.string  :zip,   null: false  
      t.integer :addressable_id
      t.string  :addressable_type
      t.timestamps null: false
    end
    add_index :addresses, :addressable_id
    create_table :interpreters do |t|
      t.integer :user_id, null: false
      t.string  :last_name, null: false
      t.string  :first_name, null: false
      t.string  :middle_name
      t.string  :title
      t.string  :prefix
      t.string  :suffix
      t.string  :gender
      t.integer :default_payrate
      t.boolean :certified
      t.string  :certification
      t.timestamps null: false
    end
  end
end