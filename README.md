# Dobra Noc

## Installation

1. Install Linux.
2. Checkout this repository.
3. Install proper ruby version with `rbenv`.
4. Install `bundler` gem globally.
5. Type `bundle install` to install ruby gems.
6. Type `yarn` to install js packages.
7. Run `rails db:migrate`.
8. If I missed something, please edit this list!

## Running

1. Connect GM3156 sonometer via USB if you want to collect records.
2. As far as I remember just run `foreman`. It uses `Procfile` to run both backend (rails) and frontend (webpack-dev-server) at once.

## Location env file config

1. Create file `location_env_variables.yml` in `config/`
2. Fill file with data like in example

```
ADDRESS: 'Your_address'
DESCRIPTION: 'Description_for_your_location'
LONGITUDE: 'Longitude_for_your_location'
LATITUDE: 'Latitude_for_your_location'
```
