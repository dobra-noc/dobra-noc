date = DateTime.parse Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default)
rnd = rand(1..100)

start_at = date.beginning_of_hour + rnd.hours
end_at = date.end_of_hour + rnd.hours

FactoryBot.define do
  factory :equivalent_continuous_sound_level do
    laeq { rand * (80 - 30) + 30 }
    location_id { nil }
    duration { :hour }
    start_at { start_at }
    end_at { end_at }
    association :location
  end
end
