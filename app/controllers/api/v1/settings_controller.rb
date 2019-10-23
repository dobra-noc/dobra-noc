# frozen_string_literal: true

module Api
  module V1
    class SettingsController < ApplicationController
      def set_location
        if location_params
          Setting.address = location_params['address']
          Setting.latitude = location_params['latitude']
          Setting.longitude = location_params['longitude']
          Setting.description = location_params['description']
          response_ok
        else
          render status: 422
        end
      end

      def start_stop_recording
        if location_params['is_recording']
          Setting.is_recording = location_params['is_recording']
          response_ok
        else
          render status: 422
        end
      end

      def is_recording
        render json: Setting.is_recording
      end

      def get_location
        data = {
          address: Setting.address,
          description: Setting.description,
          latitude: Setting.latitude,
          longitude: Setting.longitude
        }
        render json: data.as_json
      end

      private

      def location_params
        params.require(:setting).permit(:address, :description, :latitude, :is_recording, :longitude)
      end

      def recording_params
        params.require(:setting).permit(:is_recording)
      end

      def response_ok
        render status: 200
      end
    end
  end
end
