date = DateTime.parse Faker::Time.between(from: DateTime.now + 1.day, to: DateTime.now + 40.days, format: :default)

FactoryBot.define do
  factory :equivalent_continuous_sound_level do
    laeq { rand * (80 - 30) + 30 }
    location_id { nil }
    duration { :hour }
    sequence :start_at do |n|
       date.beginning_of_hour + n.hours
    end
    sequence :end_at do |n|
      date.end_of_hour + n.hours
    end
  end
end
