class WeatherController < ApplicationController
  def index
    openweathermap_api_key = Rails.application.secrets.openweathermap_api_key
    url = "http://api.openweathermap.org/data/2.5/weather?q=Givatayim&APPID=#{openweathermap_api_key}"
    @data = JSON.parse(open(url).read)
  end
end
