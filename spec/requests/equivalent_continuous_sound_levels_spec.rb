require 'rails_helper'

RSpec.describe 'EquivalentContinuousSoundLevels API', type: :request do
  let!(:location) { create(:location) }
  let(:location_id) { location.id }
  let(:sound_levels) do
    create(
      :equivalent_continuous_sound_level,
      location_id: location_id,
      start_at: DateTime.now.beginning_of_hour + id.hours,
      end_at: DateTime.now.end_of_hour + id.hours
    )
  end

  describe 'GET equivalent_continuous_sound_levels show' do
    before { get "/api/v1/equivalent_continuous_sound_levels/#{location_id}" }

    context 'when the record exists' do
      it 'returns location' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(location_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:location_id) { 54213412 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
