require 'rails_helper'

RSpec.feature 'Home page management', type: :feature, js: true do
  let!(:location) { create(:location) }
  let!(:sound_levels) do
    create_list(
      :equivalent_continuous_sound_level,
      50,
      location_id: location.id
    )
  end
  before do
    sound_levels
    basic_auth('/')
  end
  scenario 'Render map, markers and chart'do
    find('img', class: 'leaflet-marker-icon').click
    expect(page).to have_css('canvas#line-chart')
  end

  scenario 'Load all locations' do
    expect(page).to have_selector('img.leaflet-marker-icon', count: Location.count)
  end

  describe 'Calendar navigation buttons' do
    scenario 'Previous button disabled correctly' do
      find('img', class: 'leaflet-marker-icon').click
      click_button 'previous'

      expect(page).to have_button('previous', disabled: true)
      expect(page).to have_css 'div.c-pane-container'
    end

    scenario 'Previous button disabled correctly' do
      find('img', class: 'leaflet-marker-icon').click
      click_button 'next'
      click_button 'next'

      expect(page).to have_button('next', disabled: true)
      expect(page).to have_css 'div.c-pane-container'
    end
  end
end
