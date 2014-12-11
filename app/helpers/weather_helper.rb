module WeatherHelper

  def add_degree(get_temp)
    temp = get_temp
    temp.gsub!(/(\d+)(\s{1})([FC])/, '\1&deg;\2\3')
  end
end
