# frozen_string_literal: true

class ApplicationController < ActionController::API
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  rescue_from ActionController::ParameterMissing do |e|
    render status: :bad_request
  end
end
