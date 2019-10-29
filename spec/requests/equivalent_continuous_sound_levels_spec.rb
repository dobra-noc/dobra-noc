require 'rails_helper'

RSpec.describe 'EquivalentContinuousSoundLevels API', type: :request do
  let(:location) { create(:location) }
  let(:location_id) { location.id }
  let(:sound_level) do
    create(
      :equivalent_continuous_sound_level,
      start_at: DateTime.now.beginning_of_hour,
      end_at: DateTime.now.end_of_hour,
      location: location
    )
  end

  let(:show_response) do
    [
      [
        {
          "laeq"=>sound_level.laeq,
          "start_at"=>sound_level.start_at,
          "location"=>{
            "address"=>location.address
          }
        }
      ],
      {
        "dates"=>sound_level.start_at.strftime('%F')
      }
    ]
  end

  describe 'GET equivalent_continuous_sound_levels show' do
    before { get "/api/v1/equivalent_continuous_sound_levels/#{location_id}" }

    context 'when the record exists' do
      it 'returns location' do
        expect(json).not_to be_empty
        expect(json).to eq(show_response)
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
