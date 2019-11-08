# 🌘 Dobra Noc

![Dobra Noc](https://media.licdn.com/dms/image/C4D1BAQG9QXopWM9EQA/company-background_10000/0?e=1571428800&v=beta&t=qI_rgKLvyaXr0TFPzfL2dNYLTmllcTZHw4Re04nS4iA)

## 🌗 Installation

1. Install Linux. 🐧
2. Checkout this repository.
3. Install proper ruby version with `rbenv`.
4. Install `bundler` gem globally.
5. Type `bundle install --without raspberry`(if not using raspberry) or `bundle install --with raspberry` (if using raspberry) to install ruby gems.
6. Type `yarn` to install js packages.
7. Run `rails db:migrate`.
8. If I missed something, please edit this list!

## Running

1. Connect GM3156 sonometer via USB if you want to collect records.
2. Run `foreman start`. It uses `Procfile` to run both backend (rails) and frontend (webpack-dev-server) at once.

## User Interface

![](https://i.ibb.co/RHCb8F1/Zrzut-ekranu-2019-11-8-o-13-45-54.png)

### User manual

* [Home Page](https://github.com/ciembor/dobra-noc/wiki/Home-Page)
* [Settings Page](https://github.com/ciembor/dobra-noc/wiki/Settings-page)
