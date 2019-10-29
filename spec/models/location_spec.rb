require 'rails_helper'

RSpec.describe Location, type: :model do
  it { should have_many(:equivalent_continuous_sound_levels).dependent(:destroy) }
  it { should validate_uniqueness_of(:latitude).scoped_to(:longitude) }
end
