# to execute this file... rake db:add_terps

namespace :db do

  task :add_terps => :environment do
    terps = [            
      { name: "dan", email: "dan@test.com", password: 'Password1', skill_level: 'M', hourly_rate: '5500' },
      { name: "ted", email: "ted@test.com", password: 'Password1', skill_level: 'M', hourly_rate: '5600' },
      { name: "t1a", email: "t1a@test.com", password: 'Password1', skill_level: 'M', hourly_rate: '5000' },
      { name: "t1b", email: "t1b@test.com", password: 'Password1', skill_level: 'H', hourly_rate: '9000' },
      { name: "t2a", email: "t2a@test.com", password: 'Password1', skill_level: 'L', hourly_rate: '1000' },
      { name: "t2b", email: "t2b@test.com", password: 'Password1', skill_level: 'M', hourly_rate: '4500' }
    ]
    puts "\nPopulate or Update Interpreters"
    terps.each do |params|
      # first find or create the associated user record
      user_params = params.slice(:name, :email, :password, :roles)
      user = User.where(email: user_params[:email]).first || User.create(user_params)
      # then find or create the interpreter record
      terp = Interpreter.where(user_id: user.id).first
      if terp.nil?
        terp_params = params.slice(:skill_level, :hourly_rate)
        terp = Interpreter.create(terp_params.merge(user: user))
      end
      user.roles << :interpreter
      user.save
      puts "+++ terp = #{terp}"
    end
    puts "done. count=#{Interpreter.count}\n\n"
  end 
end