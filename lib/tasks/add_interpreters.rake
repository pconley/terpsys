# to execute this file... rake db:add_interpeters

namespace :db do

  task :add_interpreters => :environment do
    terps = [            
      { username: "dan", email: "dan@test.com", password: 'Password1', default_payrate: '5500', last_name: 'conley', first_name: 'dan' },
      { username: "ted", email: "ted@test.com", password: 'Password1', default_payrate: '5600', last_name: 'conley', first_name: 'ted' },
      { username: "t1a", email: "t1a@test.com", password: 'Password1', default_payrate: '5000', last_name: 'terper', first_name: '1a' },
      { username: "t1b", email: "t1b@test.com", password: 'Password1', default_payrate: '9000', last_name: 'terper', first_name: '1b' },
      { username: "t2a", email: "t2a@test.com", password: 'Password1', default_payrate: '1000', last_name: 'terper', first_name: '2a' },
      { username: "t2b", email: "t2b@test.com", password: 'Password1', default_payrate: '4500', last_name: 'terper', first_name: '2b' }
    ]
    puts "\nPopulate or Update Interpreters"
    terps.each do |params|
      # first find or create the associated user record
      user_params = params.slice(:username, :email, :password, :roles)
      user = User.where(email: user_params[:email]).first || User.create(user_params)
      # then find or create the interpreter record
      terp = Interpreter.where(user_id: user.id).first
      if terp.nil?
        terp_params = params.slice(:last_name, :first_name, :default_payrate)
        terp = Interpreter.create(terp_params.merge(user: user))
      end
      user.roles += [:interpreter]
      user.save!
      puts "+++ terp = #{terp}"
    end
    puts "done. count=#{Interpreter.count}\n\n"
  end 
end