# frozen_string_literal: true

class CreateEquivalentContinuousSoundLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :equivalent_continuous_sound_levels do |t|
      t.float :laeq, presence: true
      t.timestamp :start_at, presence: true
      t.timestamp :end_at, presence: true
      t.integer :duration, presence: true

      t.timestamps
<<<<<<< HEAD
      t.index %i[start_at end_at duration], unique: true, name: 'date_unique_index'
=======
      t.index [:start_at, :end_at, :duration], unique: true, name: "date_unique_index"
>>>>>>> fix index errors
    end
  end
end
