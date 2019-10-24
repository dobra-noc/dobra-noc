# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  rescue_from ActionController::ParameterMissing do |e|
    render plain: {error: 'Bad request'}.to_json, status: :bad_request, content_type: 'application/json'
  end
end
