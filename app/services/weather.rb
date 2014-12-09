class Weather

  def self.current_weather
    current_parsed = HTTParty.get("http://api.wunderground.com/api/0bed9de11c8446fe/conditions/q/WA/Seattle.json").parsed_response
    $redis.set("location", current_parsed["current_observation"]["display_location"]["full"])
    $redis.set("weather", current_parsed["current_observation"]["weather"])
    $redis.set("temp_f", current_parsed["current_observation"]["temperature_string"])
    $redis.set("icon", current_parsed["current_observation"]["icon_url"])
  end

  def get_location
    $redis.get("location")
  end

  def get_weather
    $redis.get("weather")
  end

  def get_temp_f
    $redis.get("temp_f")
  end

  def get_icon
    $redis.get("icon")
  end

  # def forecast
  #   forecast_parsed = HTTParty.get("http://api.wunderground.com/api/0bed9de11c8446fe/forecast10day/q/WA/Seattle.json").parsed_response
  #   period = 1
  #
  #   10.times do
  #     day_icon = forecast_parsed["forecast"]["txt_forecast"]["forecastday"][period]["icon"]
  #     day_title = forecast_parsed["forecast"]["txt_forecast"]["forecastday"][period]["title"]
  #     day_fcttext = forecast_parsed["forecast"]["txt_forecast"]["forecastday"][period]["fcttext"]
  #     period += 1
  #   end
  # end
end
