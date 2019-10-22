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
2. Run `foreman start`. It uses `Procfile` to run both backend (rails) and frontend (webpack-dev-server) at once.
