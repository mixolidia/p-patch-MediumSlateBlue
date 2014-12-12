set :output, "#{path}/log/cron.log"

every 1.minute do
  rake "set_weather_time"
end

every 1.day do
  rake "check_due_date"
end
