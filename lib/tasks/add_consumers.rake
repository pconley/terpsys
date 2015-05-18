# to execute this file... rake db:add_consumers

namespace :db do

  task :add_consumers => :environment do
    consumers = [            
      { name: "tim", email: "tim@test.com", password: 'Password1', gender: 'm', first_name: 'tim',   last_name: 'conley' },
      { name: "c1a", email: "c1a@test.com", password: 'Password1', gender: 'm', first_name: 'con-a', last_name: 'one' },
      { name: "c1b", email: "c1b@test.com", password: 'Password1', gender: 'f', first_name: 'con-b', last_name: 'one' },
      { name: "c2a", email: "c2a@test.com", password: 'Password1', gender: 'm', first_name: 'con-a', last_name: 'two' },
      { name: "c2b", email: "c2b@test.com", password: 'Password1', gender: 'f', first_name: 'con-b', last_name: 'two' }
    ]
    puts "\nPopulate or Update Consumers"
    consumers.each do |params|
      # first find or create the associated user record
      user_params = params.slice(:name, :email, :password, :roles)
      user = User.where(email: user_params[:email]).first || User.create!(user_params)
      # then find or create the consumer record
      consumer = Consumer.where(user_id: user.id).first
      if consumer.nil?
        consumer_params = params.slice(:last_name, :first_name, :gender)
        consumer = Consumer.create!(consumer_params.merge(user: user))
      end
      user.roles += [:consumer]
      user.save!
      puts "+++ consumer = #{consumer} #{user.roles}"
    end
    puts "done. count=#{Consumer.count}\n\n"
  end 
end