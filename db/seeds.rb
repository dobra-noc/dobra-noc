# frozen_string_literal: true

Location.delete_all
p 'Adding locations'
25.times do
  Location.create(
    address: Faker::Address.street_address,
    description: Faker::Address.street_name,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
  )
  print '*'
end

EquivalentContinuousSoundLevel.delete_all
date = DateTime.parse Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default)
400.times do |i|
  start_at = date.beginning_of_hour + i.hour
  end_at = date.end_of_hour + i.hour

  EquivalentContinuousSoundLevel.create(
    laeq: rand * (80 - 30) + 30,
    location_id: Location.all.ids.sample,
    duration: :hour,
    start_at: start_at,
    end_at: end_at
  )
end
p "#{EquivalentContinuousSoundLevel.count} EquivalentContinuousSoundLevels was created."
