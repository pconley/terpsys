class AddInterpreter < ActiveRecord::Migration
  def change
    
    create_table :phones do |t|
      t.string  :phone_type
      t.string  :number, null: false
      t.references :phoneable, polymorphic: true, index: true
      t.timestamps null: false
    end
    
    create_table :addresses do |t|
      t.string  :location
      t.string  :attention
      t.string  :street1, null: false
      t.string  :street2
      t.string  :city,  null: false
      t.string  :state, null: false
      t.string  :zip,   null: false  
      t.references :addressable, polymorphic: true, index: true 
      t.timestamps null: false
    end
    
    # create_table :interpreters do |t|
    #   t.integer :user_id
    #   t.integer :default_payrate
    #   t.boolean :certified
    #   t.string  :certification
    #   t.timestamps null: false
    # end
  end
end