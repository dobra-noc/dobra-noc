FactoryBot.define do
  factory :sonometr_record do
    spl { rand * (80 - 30) + 30 }
    filter { ['A', 'B'].sample }
    max_mode { false }
    measured_at { DateTime.parse Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
  end
end
