module Api
  class V1::EquivalentContinuousSoundLevelsController < ApplicationController
    # def index
    #   data = Location.last.equivalent_continuous_sound_levels.hour
    #   render json: data.as_json(only: [:start_at, :laeq], :include => { location: { only: :address } })
    # end

    def show
      data = Location.find(params[:id]).equivalent_continuous_sound_levels.hour
      dates = Location.find(params[:id])
                     .equivalent_continuous_sound_levels
                     .pluck(:start_at)
                     .map(&:to_date)
                     .uniq
                     .map { |x| x.strftime('%F') }
      render json: [
        data.as_json(only: [:start_at, :laeq], :include => { location: { only: :address } }),
        dates: dates.as_json()
      ]
    end

    def get_by_day
      data = Location.find(params[:id]).equivalent_continuous_sound_levels.hour.where(
        start_at: return_daterange(params[:day].to_date)
      )
      p params[:day]
      render json: data.as_json(only: [:start_at, :laeq], :include => { location: { only: :address } })
    end

    def get_available_days_for_location

      render json: data.as_json()
    end

    private

    def return_daterange(day)
      day + 6.hours .. day + 1.day + 6.hours
    end
  end
end
