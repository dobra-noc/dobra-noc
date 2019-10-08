module Api
  class V1::EquivalentContinuousSoundLevelsController < ApplicationController
    def index
      data = Location.last.equivalent_continuous_sound_levels.hour
      render json: data.as_json(only: [:start_at, :laeq], :include => { location: { only: :address } })
    end

    def show
      data = Location.find(params[:id]).equivalent_continuous_sound_levels.hour
      render json: data.as_json(only: [:start_at, :laeq], :include => { location: { only: :address } })
    end
  end
end
