require 'rails_helper'

RSpec.describe 'Settings API', type: :request do
  let(:location_settings) do
    {
      setting: {
        'address' => 'address',
        'description' => 'description',
        'latitude' => 'latitude',
        'longitude' => 'longitude'
      }
    }
  end

  let(:is_recording) do
    {
      setting: {
        is_recording: true
      }
    }
  end

  let(:location_default_setting) do
    {
      "address"=>"Nieznany",
      "description"=>"Nieznany",
      "latitude"=>"",
      "longitude"=>""
    }
  end

  describe 'POST settings set_location' do
    before { post '/api/v1/settings/location', params:  location_settings }

    context 'when send settings options' do

      it "set new values for location settings" do
        expect(json).to eq(location_settings[:setting])
      end

      it "return status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context 'when settings options does not send' do
      let(:location_settings) do
        {
          setting: {}
        }
      end

      it "returns status code 400" do
        expect(response).to have_http_status(400)
      end
    end
  end

  describe 'POST settings start_stop_recording' do
    before { post '/api/v1/settings/recording', params: is_recording }

    context 'when send params' do
      it "set new value for is_recording" do
        expect(json).to eq(true)
      end

      it "return status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context 'when params does not send' do
      let(:is_recording) { }

      it "returns status code 400" do
        expect(response).to have_http_status(400)
      end
    end
  end

  describe 'GET settings is_recording' do
    before { get '/api/v1/settings/is-recording' }

    context "when do correct request" do
      it "get is_recording value" do
        expect(json).to eq(false)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET settings get_locations' do
    before { get '/api/v1/settings/get-location'}

    context "when do correct request" do
      it "get location setting values" do
        expect(json).to eq(location_default_setting)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end
  end
end
