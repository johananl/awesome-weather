class WeatherController < ApplicationController
  def search
    openweathermap_api_key = Rails.application.secrets.openweathermap_api_key
    country = params[:country]
    city = params[:city]
    url = "http://api.openweathermap.org/data/2.5/weather?q=#{city},#{country}&APPID=#{openweathermap_api_key}"
    @weather_data = JSON.parse(open(url).read)
  end
end
