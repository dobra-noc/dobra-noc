module Api
  class V1::EquivalentContinuousSoundLevelsController < ApplicationController
    def index
      data = EquivalentContinuousSoundLevel.hour
      render json: data.to_json(only: [:start_at, :laeq])
    end
  end
end
