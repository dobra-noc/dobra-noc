module Api
  class V1::EquivalentContinuousSoundLevelsController < ApplicationController
    # def index
    #   data = Location.last.equivalent_continuous_sound_levels.hour
    #   render json: data.as_json(only: [:start_at, :laeq], :include => { location: { only: :address } })
    # end

    def show
      data = Location.find(params[:id]).equivalent_continuous_sound_levels.hour
      render json: data.as_json(only: [:start_at, :laeq], :include => { location: { only: :address } })
    end

    def get_by_day
      data = Location.find(params[:id]).equivalent_continuous_sound_levels.hour.where(
        start_at: return_day_with_day_time(params[:day], params[:day_time])
      )

      render json: data.as_json(only: [:start_at, :laeq], :include => { location: { only: :address } })
    end

    private

    def return_day_with_day_time(day, day_time)
      day = day.to_date
      if day_time == 'night'
        day + 22.hours .. day + 1.day + 6.hours
      elsif day_time == "day"
        day + 6.hours .. day + 22.hours
      end
    end
  end
end
