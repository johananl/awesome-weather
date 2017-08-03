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

The OpenWeatherMap API key is read as a *Rails secret* from an environment
variable. This is done to avoid having to commit sensitive information to
version control.

If the city cannot be found by the OpenWeatherMap API or if the API request
fails for some other reason, an error is shown to the user using a *flash*.

The UI was created using Bootstrap 3 with some minor CSS customizations. The
stylesheets are written in SCSS format and are compiled automatically by Rails.

## Requirements

The app was built and tested on Ruby **2.4.0** on macOS El Capitan and Ruby
**2.3.1** on Ubuntu 16.04.

## Installation

### Installing Dependencies

**NOTE: ActiveRecord isn't used by this app, however I found it easier to leave
the related configuration enabled than disabling all the related components.**

Run `bundle install` in the root of the repository in order to install the
necessary dependencies. You might need to install the following OS-level
packages for successfully installing some of the gems:

- `ruby-dev`
- `libsqlite3-dev`
- `nodejs` (required by the `uglifier` gem)

The package names above are for Ubuntu. On other platforms the names of the
equivalent packages could vary.

### Setting Environment Variables

Before running the app, the following environment variables must be set:

- `SECRET_KEY_BASE` should contain the [secret_key_base](http://guides.rubyonrails.org/upgrading_ruby_on_rails.html#config-secrets-yml)
value for the app.
- `OWM_API_KEY` should contain a valid OpenWeatherMap API key.

### Running the App

The app can be run using `rails server -e production`.

You can also use the following one-liner to generate a secret key base and
launch the app:

    SECRET_KEY_BASE=$(rake secret) OWM_API_KEY='xxxxxxx' rails server -e production

### Running the App with Docker

Make sure you have Docker installed, then run the following:

    docker run -it --rm -e SECRET_KEY_BASE='xxxxxx' -e OWM_API_KEY='xxxxxx' -p 3000:3000 johananl/awesome-weather

## Testing

The tests for this app were written using RSpec and can be executed using
`bundle exec rspec` (or `bundle exec rspec -f d` for more detailed info).

**Note that the environment variables mentioned in Installation are required for
testing, too.**

## Caveats

It seems that the OpenWeatherMap API uses [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance) for matching city
names and is therefore very forgiving for typos. As a result, it can be quite
difficult to get a search to actually fail. However, the following combination
works if you want to verify proper error handling:

- `country`: `''` (empty)
- `city`: `'xxxxxxxxxxxxxxxxxxxxxxx'`

## TODO

Given more time to work on the app, I would do the following:

- Improve error handling in calls to the OpenWeatherMap API.
- Design a better UI.
- Store retrieved weather data in the DB to use as cache.
- Add validation to the search form.
- Alert on missing environment variables.
