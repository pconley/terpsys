class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :contact_name
      t.string :string
      t.string :contact_phone
      t.string :contact_email

      t.timestamps null: false
    end
  end
end
