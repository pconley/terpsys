require 'colorize'
require 'factory_girl'

namespace :db do
    
  desc "Create sample data for use in development" 
  task :repopulate => :environment do
    agencies = [
      { agency_name: "AAA Services", passcode: "aaa" },
      { agency_name: "BBB Be Better", passcode: "bbb" }
    ]
    puts "\nClear Database"
    Agency.destroy_all
    
    puts "\nPopulate Agencies"
    agencies.each do |params| 
      code = params[:passcode]
      agency = Agency.create(params)
      puts "Created: #{agency}".blue
      %w( pat dan ).each do |name|
        x = FactoryGirl.create(:admin, username: "#{name}-#{code}", :email => "#{name}@#{code}.com", agency: agency)
        puts "-- admin user: #{x} #{x.address}"
      end
      
      FactoryGirl.create(:admin, email:"admin@#{code}.com", agency: agency)
      FactoryGirl.create(:consumer, email:"cons@#{code}.com", agency: agency)
      x = FactoryGirl.create(:customer, agency: agency)
      x.requesters << FactoryGirl.create(:user, email:"req@#{code}.com", agency: agency, roles: [:requester])
      FactoryGirl.create(:interpreter, email:"terp@#{code}.com", agency: agency)
      
      for i in 0..5 # customers
         x = FactoryGirl.create(:customer, agency: agency)
         puts "-- customer: #{x}"
         for j in 0..2
           r = x.requesters << FactoryGirl.create(:user, agency: agency, roles: [:requestor])
           puts "---- requestor: #{r}"
         end
      end
      for i in 0..5 # interpreters
         x = FactoryGirl.create(:interpreter, agency: agency)
         puts "-- interpreter: #{x} #{x.phones.first}"
      end
      for i in 0..9 # consumers
         x = FactoryGirl.create(:consumer, agency: agency)
         puts "-- consumer: #{x} #{x.address}"
      end
      for i in 0..40 # jobs
        consumer = agency.consumers.sample
        customer = agency.customers.sample
        interpreter = ([nil]+agency.interpreters.to_a).sample
        FactoryGirl.create(:job, agency: agency, customer: customer, consumer: consumer, interpreter: interpreter)
      end
      
    end
    puts "\n"
    Agency.all.each do |agency|
      puts "#{agency.agency_name}".blue
      puts "#{agency.customers.count} customers"
      puts "#{agency.interpreters.count} interpreters"
      puts "#{agency.consumers.count} consumers"
      puts "#{agency.admins.count} admins"
      puts "#{agency.users.count} agency users"
      puts "#{agency.jobs.count} agency jobs"
      puts "\n"  
    end
    puts "#{Address.count} total addresses"
    puts "#{Phone.count} total phones"
    puts "#{User.count} total users"
    puts "#{Job.count} total jobs"
  end 
  
end