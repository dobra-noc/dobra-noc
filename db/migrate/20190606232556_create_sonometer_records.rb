class CreateSonometerRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :sonometer_records do |t|
      t.decimal :spl, precision: 4, scale: 1, presence: true
      t.string :filter, limit: 1, presence: true, inclusion: ['A', 'B']
      t.boolean :max_mode, presence: true, default: false
      t.timestamp :measured_at, presence: true

      t.index :measured_at, unique: true
      t.timestamps
    end
  end
end
