# frozen_string_literal: true

module Api
  class V1::EquivalentContinuousSoundLevelsController < ApplicationController
    def show
      data = Location.find(params[:id]).equivalent_continuous_sound_levels.hour
      dates = Location.find(params[:id])
                      .equivalent_continuous_sound_levels
                      .pluck(:start_at)
                      .map(&:to_date)
                      .uniq
                      .map { |x| x.strftime('%F') }
      json_response(
        [
          data.as_json(only: %i[start_at laeq], include: { location: { only: :address } }),
          dates: dates.as_json
        ]
      )
    end

    def get_by_day
      not_found unless params[:day]
      data = Location.find(params[:id]).equivalent_continuous_sound_levels.hour.where(
        start_at: return_daterange(params[:day].to_date)
      )
      json_response(data.as_json(only: %i[start_at laeq], include: { location: { only: :address } }))
    end

    def get_available_days_for_location
      json_response(data)
    end

    private

    def return_daterange(day)
      day + 6.hours..day + 1.day + 6.hours
    end
  end
end
