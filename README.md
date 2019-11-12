# 🌘 Dobra Noc

![Dobra Noc](https://i.ibb.co/xC0SJSx/dobranoc.jpg)

## 🌗 Installation

1. Install Linux. 🐧
2. Checkout this repository.
3. Install proper ruby version with `rbenv`.
4. Install `bundler` gem globally.
5. Type `bundle install --without raspberry` (if not using raspberry) or `bundle install --with raspberry` (if using raspberry) to install ruby gems.
6. Type `yarn` to install js packages.
7. Run `rails db:migrate`.
8. If I missed something, please edit this list!

## 🌖 Running

1. Connect GM3156 sonometer via USB if you want to collect records.
2. Run `foreman start`. It uses `Procfile` to run both backend (rails) and frontend (webpack-dev-server) at once.

## 🌕 User Interface

* [Home Page](https://github.com/ciembor/dobra-noc/wiki/Home-Page)
* [Settings Page](https://github.com/ciembor/dobra-noc/wiki/Settings-page)
