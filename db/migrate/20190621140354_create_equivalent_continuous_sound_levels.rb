class CreateEquivalentContinuousSoundLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :equivalent_continuous_sound_levels do |t|
      t.float :laeq, presence: true
      t.timestamp :start_at, presence: true
      t.timestamp :end_at, presence: true
      t.integer :duration, presence: true

      t.timestamps
      t.index :start_at, unique: true
      t.index :end_at, unique: true
      t.index :duration, unique: true
    end
  end
end
