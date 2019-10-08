# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Location.delete_all
25.times do
  Location.create(
    address: Faker::Address.street_address,
    description: Faker::Address.street_name,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
  )
end
p "#{Location.count} locations was created."

EquivalentContinuousSoundLevel.delete_all
date = DateTime.parse Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default)
400.times do |i|

  start_at = date.beginning_of_hour + i.hour
  end_at = date.end_of_hour + i.hour

  EquivalentContinuousSoundLevel.create(
    laeq: rand*(80-30) + 30,
    location_id: Location.all.ids.sample,
    duration: :hour,
    start_at: start_at,
    end_at: end_at
  )
end
p "#{EquivalentContinuousSoundLevel.count} EquivalentContinuousSoundLevels was created."
