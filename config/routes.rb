# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  namespace :api do
    namespace :v1 do
      resources :equivalent_continuous_sound_levels, only: %i[index show]
      get 'equivalent_continuous_sound_levels/:id/:day', to: 'equivalent_continuous_sound_levels#get_by_day'
      resources :locations, only: :index
    end
  end

  root to: 'home#index'
end
