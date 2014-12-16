# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'resque/tasks'
require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task "resque:setup" => :environment

task "set_weather_time" => :environment do
  Weather.current_weather
end

task "check_due_date" => :environment do
  Tool.check_due_date
end

task "send_recent_post" => :environment do
  Post.send_recent_post
end
