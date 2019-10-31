require "rails_helper"

RSpec.feature "Settings page management", type: :feature, js: true do
  let(:settings) do
    {
      address: 'addresss',
      latitude: '20.22222',
      longitude: '10.1111',
      description: 'address description'
    }
  end

  before do
    basic_auth('/settings')
  end

  scenario "Send settings data correctly"do
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
end
