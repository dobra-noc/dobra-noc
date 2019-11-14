require 'rails_helper'

RSpec.feature 'Home page management', type: :feature, js: true do
  let!(:location) { create(:location, latitude: '49.83798245308484', longitude: '18.984375000000004') }
  let!(:sound_levels) do
    create_list(
      :equivalent_continuous_sound_level,
      50,
      location_id: location.id
    )
  end
  before(:each) do
    sound_levels
    basic_auth('/')
    page.driver.browser.manage.window.resize_to(1280, 1024)
  end

  scenario 'Render map, markers and chart'do
    find('img', class: 'leaflet-marker-icon').click

    expect(page).to have_css('canvas#line-chart')
  end

  scenario 'Load all locations' do
    expect(page).to have_selector('img.leaflet-marker-icon', count: Location.count)
  end

  describe 'Chart' do
    scenario 'Did root chart is correct' do
      find('img', class: 'leaflet-marker-icon').click
      execute_script("arguments[0].scrollIntoView();",find('canvas#line-chart'))
      sleep 1

      expect(find('canvas#line-chart')).to match_image('TestRootChart')
    end
    scenario 'Did day chart is correct' do
      find('img', class: 'leaflet-marker-icon').click
      click_button 'previous'
      execute_script("arguments[0].scrollIntoView();",find('canvas#line-chart'))
      sleep 1

      expect(find('canvas#line-chart')).to match_image('TestPreviousChart')
    end
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
