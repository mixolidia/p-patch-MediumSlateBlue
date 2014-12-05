class Weather

  def current_weather
    HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=Seattle").parsed_response
  end

  def forecast
    HTTParty.get("http://api.openweathermap.org/data/2.5/forecast?q=Seattle").parsed_response
  end

end
