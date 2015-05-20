echo "Reseting heroku database"

bundle exec rake db:drop
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
bundle exec rake db:add_customers
bundle exec rake db:add_users
bundle exec rake db:add_interpreters
bundle exec rake db:add_consumers

echo "Reset complete."
