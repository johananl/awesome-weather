class WeatherController < ApplicationController
  def search
    openweathermap_api_key = Rails.application.secrets.openweathermap_api_key
    city = params[:city]
    url = "http://api.openweathermap.org/data/2.5/weather?q=#{city}&APPID=#{openweathermap_api_key}"
    @weather_data = JSON.parse(open(url).read)
  end
end
