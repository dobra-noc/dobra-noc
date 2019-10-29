# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    http_authenticate
  end

  private

  def http_authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == Setting.username && password == Setting.password
    end
  end
end
