date = DateTime.now

FactoryBot.define do
  factory :equivalent_continuous_sound_level do
    sequence :laeq do |n|
      30 + n * 1.2
    end
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
