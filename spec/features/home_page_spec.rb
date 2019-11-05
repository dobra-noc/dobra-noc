require 'rails_helper'

RSpec.feature 'Home page management', type: :feature, js: true do
  let(:location) { create(:location) }
  let(:sound_level) do
    create(
      :equivalent_continuous_sound_level,
      start_at: DateTime.now.beginning_of_hour,
      end_at: DateTime.now.end_of_hour,
      location: location
    )
  end
  before do
    sound_level
    basic_auth('/')
  end
  scenario 'Render map, markers and chart'do
    find('img', class: 'leaflet-marker-icon').click
    expect(page).to have_css('canvas#line-chart')
  end

  scenario 'Load all locations' do
    expect(page).to have_selector('img.leaflet-marker-icon', count: Location.count)
  end
end
