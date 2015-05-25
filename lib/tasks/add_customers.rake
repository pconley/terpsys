# to execute this file... rake db:add_customers

namespace :db do
    
  task :add_customers => :environment do
    customers = [
      { customer: {company_name: "Rochester Terps", requester_name: "Roc Boss", 
        requester_email: "rto3@test.com", billing_email: "rto3@test.com", billing_rate: 100}, 
        address: {street1: 'Oakdale Dr.', city: 'Roch', state: 'NY', zip: '14666'}
      },
      { customer: { company_name: "InTerpUs Agency", requester_name: "Terp Boss", 
        requester_email: "boss@test.com", billing_email: "boss@test.com", billing_rate: 200},
        address: {street1: 'High Dr.', city: 'Pitts', state: 'PA', zip: '16666'}
      }
    ]
    
    Customer.destroy_all ###################
    
    puts "\nPopulate Customers"
    customers.each do |params| 
      company_name = params[:customer][:company_name]
      customer = Customer.where(company_name: company_name).first
      if customer # already exists
        customer.update(params[:customer])
        customer.address.update(params[:address])
      else
        customer = Customer.create(params[:customer])
        customer.create_address(params[:address])
        # puts "customer errors = #{customer.errors.full_messages}"
      end
      puts "+++ customer = #{customer} #{customer.address}"
    end
    puts "done. count=#{Customer.count}\n\n"
  end 
end