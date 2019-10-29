# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  
  rescue_from ActionController::ParameterMissing do |e|
    render plain: {error: 'Bad request'}.to_json, status: :bad_request, content_type: 'application/json'
  end

  def render_unprocessable_entity_response(exception)
    render json: exception.record.errors, status: :unprocessable_entity
  end

  def render_not_found_response(exception)
    render json: { error: exception.message }, status: :not_found
  end
end
