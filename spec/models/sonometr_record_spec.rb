require 'rails_helper'

RSpec.describe SonometerRecord, type: :model do
  it { should validate_presence_of(:measured_at) }
  it { should validate_presence_of(:spl) }
  it { should validate_presence_of(:filter) }
  it { should validate_inclusion_of(:filter).in_array(['A', 'B']) }
  it { should validate_uniqueness_of(:measured_at) }
  it { should validate_numericality_of(:spl).is_greater_than(0) }
end
