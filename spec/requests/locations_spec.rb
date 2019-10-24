require 'rails_helper'

RSpec.describe 'Locations API', type: :request do
  let!(:locations) { create_list(:location, 5) }

  describe 'GET /api/v1/locations' do
    before { get '/api/v1/locations' }

    it 'returns locations' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status 200' do
      expect(response).to have_http_status(200)
    end
  end
end
