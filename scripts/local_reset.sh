echo "Reseting local environment"

bundle install

bundle exec rake db:drop
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
bundle exec rake db:add_customers
bundle exec rake db:add_users
bundle exec rake db:add_interpreters
bundle exec rake db:add_consumers

RAILS_ENV=test bundle exec rake db:drop
RAILS_ENV=test bundle exec rake db:create
RAILS_ENV=test bundle exec rake db:migrate
RAILS_ENV=test bundle exec rake db:seed

echo "Reset complete."
