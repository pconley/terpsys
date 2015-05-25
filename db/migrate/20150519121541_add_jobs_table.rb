class AddJobsTable < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      
      t.string  :status,         null: false
      t.integer :customer_id,    null: false
      t.integer :consumer_id,    null: false
      t.integer :interpreter_id
      
      t.string    :description,   null: false
      # location is a polymorphic address
      t.timestamp :starts_on,     null: false
      t.timestamp :starts_at,     null: false
      t.integer   :duration,      null: false
      t.boolean   :repeats,       null: false
      t.string    :repeat_style
      t.string    :repeat_pattern
      t.timestamp :ends_on
      t.timestamp :ends_by
      
      t.timestamp :requested_at, null: false
      t.string    :requested_by_name
      t.string    :requested_by_email
      t.string    :requested_by_phone
      
      t.text    :interpreter_notes
      t.integer :interpreter_pay_rate
      
      t.string  :site_contact_name
      t.string  :site_contact_email
      t.string  :site_contact_phone
      
      t.text    :billing_notes
      t.integer :billing_rate
      t.integer :billable_minutes
      t.integer :billing_miles
      
      t.boolean :bill
      t.boolean :pay
      
      t.integer :payroll_minutes
      t.integer :payroll_miles
      t.integer :milage_rate
      
      t.integer :expenses
      
      t.timestamps null: false
    end
    
  end
end