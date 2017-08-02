# Awesome Weather - A Rails Exercise

## General

This Rails app shows the current weather in the given city. It implements the
[OpenWeatherMap API](https://openweathermap.org/api) to retrieve weather data.

## Design

The app does **not** store weather data in the database but rather fetches the
data dynamically every time.

The app has one controller called `weather` which has one action called
`search`. When invoked, the `search` action queries the OpenWeatherMap API using
the `country` and `city` params which are provided by the user.

The OpenWeatherMap API key is read as a *rails secret* from an environment
variable. This is done to avoid having to commit sensitive information to
version control.

If the city cannot be found by the OpenWeatherMap API or if the API request
fails for some other reason, an error is shown to the user using a *flash*.

The UI was created using Bootstrap 3 with some minor CSS customizations. The
stylesheets are written in SCSS format and are compiled automatically by rails.

## Requirements

## Installation

## Testing

## Caveats
