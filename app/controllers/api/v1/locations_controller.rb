# frozen_string_literal: true

class Api::V1::LocationsController < ApplicationController
  def index
    data = Location.all
    render json: data
  end
end
