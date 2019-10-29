# frozen_string_literal: true

module Api
  module V1
    class SettingsController < ApplicationController
      def set_location
        Setting.address = location_params['address']
        Setting.latitude = location_params['latitude']
        Setting.longitude = location_params['longitude']
        Setting.description = location_params['description']

        json_response(location_settings)
      end

      def start_stop_recording
        Setting.is_recording = location_params['is_recording']
        json_response(Setting.is_recording)
      end

      def is_recording
        json_response(Setting.is_recording)
      end

      def get_location
        json_response(location_settings)
      end

      private

      def location_params
        params.require(:setting).permit(:address, :description, :latitude, :is_recording, :longitude)
      end

      def recording_params
        params.require(:setting).permit(:is_recording)
      end

      def location_settings
        {
          address: Setting.address,
          description: Setting.description,
          latitude: Setting.latitude,
          longitude: Setting.longitude
        }
      end
    end
  end
end
