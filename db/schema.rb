# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_191_004_100_938) do
  create_table 'equivalent_continuous_sound_levels', force: :cascade do |t|
    t.float 'laeq'
    t.datetime 'start_at'
    t.datetime 'end_at'
    t.integer 'duration'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'location_id'
    t.index ['location_id'], name: 'index_equivalent_continuous_sound_levels_on_location_id'
    t.index %w[start_at end_at duration], name: 'date_unique_index', unique: true
  end

  create_table 'locations', force: :cascade do |t|
    t.string 'address', default: 'Nieznany'
    t.text 'description'
    t.string 'latitude'
    t.string 'longitude'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['address'], name: 'index_locations_on_address', unique: true
    t.index %w[latitude longitude], name: 'index_locations_on_latitude_and_longitude', unique: true
  end

  create_table 'locations', force: :cascade do |t|
    t.string 'address', default: 'Nieznany'
    t.text 'description'
    t.string 'latitude'
    t.string 'longitude'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['address'], name: 'index_locations_on_address', unique: true
    t.index %w[latitude longitude], name: 'index_locations_on_latitude_and_longitude', unique: true
  end

  create_table 'sonometer_records', force: :cascade do |t|
    t.decimal 'spl', precision: 4, scale: 1
    t.string 'filter', limit: 1
    t.boolean 'max_mode', default: false
    t.datetime 'measured_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['measured_at'], name: 'index_sonometer_records_on_measured_at', unique: true
  end
end
