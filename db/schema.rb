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

ActiveRecord::Schema[7.0].define(version: 2022_11_07_175956) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "areas", force: :cascade do |t|
    t.integer "population"
    t.float "square"
    t.string "name"
    t.float "population_density"
    t.float "square_housing_stock"
    t.float "living_square_per_person"
    t.bigint "district_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "2gis_id"
    t.text "polygon"
    t.integer "polygon_type"
    t.string "center_coord"
    t.index ["district_id"], name: "index_areas_on_district_id"
  end

  create_table "automatic_post_offices", force: :cascade do |t|
    t.float "geo_data", default: [], array: true
    t.bigint "area_id"
    t.boolean "is_placed", default: false
    t.string "address"
    t.bigint "placement_object_type_id"
    t.integer "people_in_range"
    t.integer "distance_to_metro"
    t.integer "distance_to_bus"
    t.float "predict_a"
    t.float "predict_b"
    t.float "predict_c"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["area_id"], name: "index_automatic_post_offices_on_area_id"
    t.index ["distance_to_bus"], name: "index_automatic_post_offices_on_distance_to_bus"
    t.index ["distance_to_metro"], name: "index_automatic_post_offices_on_distance_to_metro"
    t.index ["is_placed"], name: "index_automatic_post_offices_on_is_placed"
    t.index ["people_in_range"], name: "index_automatic_post_offices_on_people_in_range"
    t.index ["placement_object_type_id"], name: "index_automatic_post_offices_on_placement_object_type_id"
    t.index ["predict_a"], name: "index_automatic_post_offices_on_predict_a"
    t.index ["predict_b"], name: "index_automatic_post_offices_on_predict_b"
    t.index ["predict_c"], name: "index_automatic_post_offices_on_predict_c"
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.string "short_name"
    t.float "square"
    t.integer "population"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "2gis_id"
    t.text "polygon"
    t.integer "polygon_type"
    t.string "center_coord"
  end

  create_table "houses", force: :cascade do |t|
    t.string "address"
    t.float "square"
    t.integer "year"
    t.integer "floors"
    t.integer "entrances"
    t.integer "rooms"
  end

  create_table "mos_culture_houses", force: :cascade do |t|
    t.string "common_name"
    t.bigint "global_id"
    t.string "full_name"
    t.string "short_name"
    t.jsonb "org_info", default: [], array: true
    t.jsonb "object_address", default: [], array: true
    t.string "chief_org"
    t.string "chief_name"
    t.string "chief_position"
    t.string "public_phone"
    t.string "email"
    t.jsonb "working_hours", default: [], array: true
    t.string "clarification_of_working_hours"
    t.string "web_site"
    t.jsonb "geo_data"
    t.bigint "mos_dataset_id", null: false
    t.index ["mos_dataset_id"], name: "index_mos_culture_houses_on_mos_dataset_id"
  end

  create_table "mos_datasets", force: :cascade do |t|
    t.integer "version_number"
    t.integer "release_number"
    t.string "caption"
    t.string "publish_date"
    t.integer "category_id"
    t.integer "department_id"
    t.text "full_description"
    t.text "keywords"
    t.boolean "contains_geodata"
    t.boolean "contains_acc_env_data"
    t.boolean "is_foreign"
    t.boolean "is_seasonal"
    t.boolean "is_archive"
    t.boolean "is_new"
    t.string "identification_number"
    t.string "season"
    t.string "last_update_date"
    t.string "sef_url"
  end

  create_table "mos_kiosks", force: :cascade do |t|
    t.bigint "global_id"
    t.string "object_type"
    t.string "name"
    t.string "adm_area"
    t.string "district"
    t.string "address"
    t.string "unom"
    t.string "specialization"
    t.string "period_of_placement"
    t.integer "facility_area"
    t.string "contract_status"
    t.string "contract_number"
    t.string "name_of_business_entity"
    t.string "contract_begin"
    t.string "contract_end"
    t.string "contract_basis"
    t.string "start_date_trading"
    t.string "contract_type"
    t.jsonb "geo_data"
    t.bigint "mos_dataset_id", null: false
    t.index ["mos_dataset_id"], name: "index_mos_kiosks_on_mos_dataset_id"
  end

  create_table "mos_libraries", force: :cascade do |t|
    t.string "common_name"
    t.string "full_name"
    t.string "short_name"
    t.jsonb "org_info", default: [], array: true
    t.jsonb "object_address", default: [], array: true
    t.string "chief_org"
    t.string "chief_name"
    t.string "chief_position"
    t.string "public_phone"
    t.string "email"
    t.jsonb "working_hours", default: [], array: true
    t.string "clarification_of_working_hours"
    t.string "web_site"
    t.integer "num_of_seats"
    t.integer "num_of_readers"
    t.integer "num_of_visitors"
    t.bigint "global_id"
    t.jsonb "geo_data"
    t.bigint "mos_dataset_id", null: false
    t.index ["mos_dataset_id"], name: "index_mos_libraries_on_mos_dataset_id"
  end

  create_table "mos_multifunctional_centers", force: :cascade do |t|
    t.string "common_name"
    t.string "full_name"
    t.string "short_name"
    t.string "adm_area"
    t.string "district"
    t.string "address"
    t.string "chief_name"
    t.string "chief_position"
    t.string "public_phone"
    t.jsonb "working_hours", default: [], array: true
    t.string "clarification_of_working_hours"
    t.string "open_date"
    t.string "extra_services", default: [], array: true
    t.float "center_area"
    t.integer "window_count"
    t.string "web_site"
    t.jsonb "availability", default: [], array: true
    t.bigint "global_id"
    t.jsonb "geo_data"
    t.bigint "mos_dataset_id", null: false
    t.index ["mos_dataset_id"], name: "index_mos_multifunctional_centers_on_mos_dataset_id"
  end

  create_table "mos_rows", force: :cascade do |t|
    t.bigint "global_id"
    t.jsonb "geo_data"
    t.bigint "mos_dataset_id", null: false
    t.jsonb "data"
    t.index ["mos_dataset_id"], name: "index_mos_rows_on_mos_dataset_id"
  end

  create_table "mos_shopping_facilities", force: :cascade do |t|
    t.bigint "global_id"
    t.string "object_type"
    t.string "name"
    t.string "adm_area"
    t.string "district"
    t.string "address"
    t.string "unom"
    t.string "specialization"
    t.string "period_of_placement"
    t.integer "facility_area"
    t.string "contract_status"
    t.string "contract_number"
    t.string "name_of_business_entity"
    t.string "contract_begin"
    t.string "contract_end"
    t.string "contract_basis"
    t.string "start_date_trading"
    t.string "end_date_trading"
    t.string "contract_type"
    t.jsonb "geo_data"
    t.bigint "mos_dataset_id", null: false
    t.index ["mos_dataset_id"], name: "index_mos_shopping_facilities_on_mos_dataset_id"
  end

  create_table "mos_sports_facilities", force: :cascade do |t|
    t.string "short_name"
    t.string "full_name"
    t.string "common_name"
    t.jsonb "org_info", default: [], array: true
    t.jsonb "object_address", default: [], array: true
    t.string "chief_name"
    t.string "chief_position"
    t.string "chief_phone"
    t.string "public_phone"
    t.string "email"
    t.string "web_site"
    t.string "clarification_working_hours"
    t.jsonb "working_hours", default: [], array: true
    t.bigint "global_id"
    t.jsonb "geo_data"
    t.bigint "mos_dataset_id", null: false
    t.index ["mos_dataset_id"], name: "index_mos_sports_facilities_on_mos_dataset_id"
  end

  create_table "placement_object_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vacuum_cleaner_statuses", force: :cascade do |t|
    t.integer "successful", default: [], array: true
    t.integer "failed", default: [], array: true
    t.string "info", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "areas", "districts"
  add_foreign_key "automatic_post_offices", "areas"
  add_foreign_key "automatic_post_offices", "placement_object_types"
  add_foreign_key "mos_culture_houses", "mos_datasets"
  add_foreign_key "mos_kiosks", "mos_datasets"
  add_foreign_key "mos_libraries", "mos_datasets"
  add_foreign_key "mos_multifunctional_centers", "mos_datasets"
  add_foreign_key "mos_rows", "mos_datasets"
  add_foreign_key "mos_shopping_facilities", "mos_datasets"
  add_foreign_key "mos_sports_facilities", "mos_datasets"
end
