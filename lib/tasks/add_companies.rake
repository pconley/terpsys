# to execute this file... rake db:add_companies

namespace :db do

  task :add_companies => :environment do
    companies = [
      { name: "Rochester Terps", contact_email: "rto3@test.com"},
      { name: "InTerpUs Agency", contact_email: "boss@test.com"}
    ]
    puts "\nPopulate companies"
    companies.each do |params| 
      company = Company.where(name: params[:name]).first
      if company
        company.update(params)
      else
        company = Company.create(params)
      end
      puts "+++ company = #{company}"
    end
    puts "done. count=#{Company.count}\n\n"
  end 
end