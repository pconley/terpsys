# to execute this file... rake db:add_users

namespace :db do

  task :add_users => :environment do
    users = [
      { name: "pat", email: "pat@test.com", password: 'Password1', roles: [:admin] },
      { name: "dan", email: "dan@test.com", password: 'Password1', roles: [:admin] },
      { name: "tim", email: "tim@test.com", password: 'Password1', roles: [:consumer] }
    ]
    puts "\nPopulate or Update Users"
    users.each do |params| 
      user = User.where(email: params[:email]).first
      if user
        user.update(params)
      else
        user = User.create(params)
      end
      puts "+++ user = #{user}"
    end
    puts "done. count=#{User.count}\n\n"
  end 
end