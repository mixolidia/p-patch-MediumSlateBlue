class Weather

  def current_weather
    current_parsed = HTTParty.get("http://api.wunderground.com/api/0bed9de11c8446fe/conditions/q/WA/Seattle.json").parsed_response
    location = current_parsed["current_observation"]["display_location"]["full"]
    weather = current_parsed["current_observation"]["weather"]
    temp_f = current_parsed["current_observation"]["temperature_string"]

    "It is currently #{temp_f} and #{weather} in #{location}.  \n"
  end

  def forecast
    forecast_parsed = HTTParty.get("http://api.wunderground.com/api/0bed9de11c8446fe/forecast10day/q/WA/Seattle.json").parsed_response

    #loop 
    day1_icon = forecast_parsed["forecast"]["txt_forecast"]["forecastday"][1]["icon"]
    day1_title = forecast_parsed["forecast"]["txt_forecast"]["forecastday"][1]["title"]
    day1_fcttext = forecast_parsed["forecast"]["txt_forecast"]["forecastday"][1]["fcttext"]
    "#{day1_title}"
    "#{day1_icon}"
    "#{day1_fcttext}"
  end

end
