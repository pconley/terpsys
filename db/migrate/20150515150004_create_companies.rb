class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string  :company_name
      t.string  :requester_name
      t.string  :requester_email
      t.string  :billing_email
      t.integer :billing_rate
      t.timestamps null: false
    end
  end
end
