namespace :db do
  desc "Raise an error unless the RAILS_ENV is development"
  task :development_environment_only do
    raise "Hey, development only you monkey!" unless RAILS_ENV == 'development'
  end

  desc "Drop, create, migrate then seed the database"
  task :seed => [
    'environment',
    'db:drop',
    'db:create',
    'db:migrate',
    'db:fixtures:load'
  ]
end