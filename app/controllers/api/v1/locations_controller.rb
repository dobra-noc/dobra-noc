# frozen_string_literal: true

class Api::V1::LocationsController < ApplicationController
  def index
    data = Location.all
    json_response(data)
  end
end
