date = DateTime.now

FactoryBot.define do
  factory :equivalent_continuous_sound_level do
    sequence(:laeq, 2) { |n| 30 + n }
    location_id { nil }
    duration { :hour }
    sequence(:start_at) { |n| (date+ n.hours).beginning_of_hour }
    sequence(:end_at) { |n| (date + n.hours).end_of_hour }
  end
end
