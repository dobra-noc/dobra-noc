# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  namespace :api do
    namespace :v1 do
      resources :equivalent_continuous_sound_levels, only: :show
      get 'equivalent_continuous_sound_levels/:id/:day', to: 'equivalent_continuous_sound_levels#get_by_day'
      resources :locations, only: :index

      post 'settings/location', to: 'settings#set_location'
      post 'settings/recording', to: 'settings#start_stop_recording'
      get 'settings/get-location', to: 'settings#get_location'
      get 'settings/is-recording', to: 'settings#is_recording'
    end
  end

  root to: 'home#index'
  get '/*path', to: 'home#index'
end
