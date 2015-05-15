# to execute this file... rake db:add_users

namespace :db do

  task :add_users => :environment do
    users = [
      { name: "pat", email: "pat@test.com"},
      { name: "dan", email: "dan@test.com"}
    ]
    puts "\nPopulate users"
    User.destroy_all
    users.each do |params| 
      user = User.create_with(params.merge({password: 'Password1'})).find_or_create_by(email: params[:email])
      puts "+++ user = #{user}"
    end
    puts "done. count=#{User.count}\n\n"
  end 
end