class AddReferencesToEquivalentContinousSoundLevels < ActiveRecord::Migration[5.2]
  def change
    add_reference :equivalent_continuous_sound_levels, :location, foreign_key: true
  end
end
