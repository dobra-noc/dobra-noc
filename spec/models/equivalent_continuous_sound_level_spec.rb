require 'rails_helper'

RSpec.describe EquivalentContinuousSoundLevel, type: :model do
  it { should belong_to(:location) }

  it { should define_enum_for(:duration).with_values([:hour]) }

  it { should validate_presence_of(:start_at) }
  it { should validate_presence_of(:end_at) }
  it { should validate_presence_of(:location_id) }
  it { should validate_presence_of(:laeq) }
  it { should validate_presence_of(:duration) }
  it { should validate_numericality_of(:laeq).is_greater_than(0) }
  it { should validate_uniqueness_of(:start_at).scoped_to([:end_at, :duration]) }
end
