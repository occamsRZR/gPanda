require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Brandon Fulk",
                 :email => "brandon.fulk@gmail.com",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
                  
    end
    User.all(:limit => 6).each do |user|
      50.times do
        job = user.jobs.create!(:method => "svm", :name => Faker::Lorem.sentence(1), :public => "true", :genome => "A. thaliana") 
        50.times do
          gi = rand(30000).to_s(16)
          score = rand.round(8).to_s
          analysis_id = rand(200)
          job.results.create!(:gi => gi, :score => score, :analysis_id => analysis_id)
        end
      end
    end
  end
end