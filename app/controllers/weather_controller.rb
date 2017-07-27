require 'date'

class WeatherController < ApplicationController
  def search
    # Get OpenWeatherMap API key from secret store
    openweathermap_api_key = Rails.application.secrets.openweathermap_api_key

    # Get country and city from request params
    country = params[:country]
    city = params[:city]

    # Query the OpenWeatherMap API
    # TODO Support multiple temperature units?
    url = "http://api.openweathermap.org/data/2.5/weather?q=#{city},#{country}&APPID=#{openweathermap_api_key}&units=metric"
    data = JSON.parse(open(url).read)

    # Extract interesting data from response
    @city = data['name']
    @country = data.dig('sys', 'country')
    @time = Time.at(data['dt']).to_datetime
    @conditions = data.dig('weather', 0, 'description').split.map(&:capitalize).join(' ')
    @temp = data.dig('main', 'temp')
    @icon = data.dig('weather', 0, 'icon')
  end
end
