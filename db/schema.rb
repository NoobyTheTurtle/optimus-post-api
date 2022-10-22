# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_22_163204) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mos_datasets", force: :cascade do |t|
    t.string "caption"
    t.integer "category_id"
    t.text "keywords"
    t.boolean "contains_geodata"
    t.string "identification_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_mos_datasets_on_category_id"
  end

  create_table "mos_rows", force: :cascade do |t|
    t.bigint "global_id"
    t.jsonb "geo_data"
    t.string "email"
    t.string "public_phone"
    t.text "common_name"
    t.bigint "mos_dataset_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mos_dataset_id"], name: "index_mos_rows_on_mos_dataset_id"
  end

  add_foreign_key "mos_rows", "mos_datasets"
end
