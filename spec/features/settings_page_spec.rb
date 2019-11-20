require 'rails_helper'

RSpec.feature 'Settings page management', type: :feature, js: true do
  let(:location) { create(:location) }
  let(:sound_level) do
    create(
      :equivalent_continuous_sound_level,
      location_id: location.id
    )
  end

  let(:settings) do
    {
      address: Faker::Address.street_address,
      description: Faker::Address.street_name
    }
  end

  before(:each) do
    basic_auth('/settings')
    page.driver.browser.manage.window.resize_to(1280, 1024)
  end

  scenario 'Get latlong from map' do
    sleep 1
    find('div.vue2leaflet-map').click(0,0)

    expect(page).to have_field('latitude', with: '49.83798245308484', disabled: true)
    expect(page).to have_field('longitude', with: '18.984375000000004', disabled: true)
  end

  scenario 'Send settings data correctly' do
    sleep 1
    fill_in('address', with: settings[:address])
    fill_in('description', with: settings[:description])
    click_button('Submit location')

    expect(page).to have_field('address', with: settings[:address])
    expect(page).to have_field('description', with: settings[:description])
  end

  scenario 'Load all locations to select' do
    expect(page).to have_selector('select option', count: Location.count)
  end

  scenario 'Load all location' do
    expect(page).to have_selector('img.leaflet-marker-icon', count: Location.count)
  end
end
