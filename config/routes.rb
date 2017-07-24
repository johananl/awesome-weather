Rails.application.routes.draw do
  get 'weather/index'
  get 'weather/search'

  root 'weather#index'
end
