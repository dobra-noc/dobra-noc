require 'rails_helper'

RSpec.feature 'Settings page management', type: :feature, js: true do
  let(:location) { create(:location) }
  let(:sound_level) do
    create(
      :equivalent_continuous_sound_level,
      start_at: DateTime.now.beginning_of_hour,
      end_at: DateTime.now.end_of_hour,
      location: location
    )
  end

  let(:settings) do
    {
      address: 'woooooooooorkkkkkk',
      latitude: '20.22222',
      longitude: '10.1111',
      description: 'address description'
    }
  end

  before(:each) do
    basic_auth('/settings')
    page.driver.browser.manage.window.resize_to(1280, 1024)
  end

  scenario 'Get latlong from map' do
    find('div.vue2leaflet-map').click(0,0)

    expect(find_field('latitude').value).to eq '49.83798245308484'
    expect(find_field('longitude').value).to eq '18.984375000000004'
  end

  scenario 'Send settings data correctly' do
    fill_in 'address', with: settings[:address]
    fill_in 'longitude', with: settings[:longitude]
    fill_in 'latitude', with: settings[:latitude]
    fill_in 'description', with: settings[:description]
    click_button('Submit location')

    expect(find_field('address').value).to eq settings[:address]
    expect(find_field('longitude').value).to eq settings[:longitude]
    expect(find_field('latitude').value).to eq settings[:latitude]
    expect(find_field('description').value).to eq settings[:description]
  end

  scenario 'Load all locations to select' do
    expect(page).to have_selector('select option', count: Location.count)
  end

  scenario 'Load all location' do
    expect(page).to have_selector('img.leaflet-marker-icon', count: Location.count)
  end
end
