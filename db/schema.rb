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

ActiveRecord::Schema[7.0].define(version: 2023_10_03_072535) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
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

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.citext "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.string "phone_number", default: "0", null: false
    t.string "country_code", default: "+91", null: false
    t.string "password", default: "", null: false
    t.string "confirm_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth_token"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "asset_specifications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "name"
    t.string "value"
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_asset_specifications_on_company_id"
  end

  create_table "asset_tables", force: :cascade do |t|
    t.integer "companyId"
    t.integer "asset_id"
    t.integer "product_catagory_id"
    t.integer "product_type_id"
    t.integer "product_id"
    t.integer "vendor_id"
    t.string "asset_name"
    t.integer "price"
    t.string "description_id"
    t.integer "company_location_id"
    t.date "purchase_date"
    t.date "warranty_expiry_date"
    t.integer "purchase_type_id"
    t.integer "useful_life"
    t.integer "residual_value"
    t.integer "description"
    t.integer "assest_specification_id"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assets", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.uuid "product_category_id", null: false
    t.uuid "product_type_id", null: false
    t.bigint "product_id", null: false
    t.string "asset_name"
    t.integer "price"
    t.string "description"
    t.bigint "location_id", null: false
    t.date "purchase_id"
    t.date "warranty_expiry_date"
    t.uuid "purchase_type_id", null: false
    t.uuid "asset_specification_id", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "vendor_id", null: false
    t.string "serial_number"
    t.index ["asset_specification_id"], name: "index_assets_on_asset_specification_id"
    t.index ["company_id"], name: "index_assets_on_company_id"
    t.index ["location_id"], name: "index_assets_on_location_id"
    t.index ["product_category_id"], name: "index_assets_on_product_category_id"
    t.index ["product_id"], name: "index_assets_on_product_id"
    t.index ["product_type_id"], name: "index_assets_on_product_type_id"
    t.index ["purchase_type_id"], name: "index_assets_on_purchase_type_id"
    t.index ["vendor_id"], name: "index_assets_on_vendor_id"
  end

  create_table "assign_assets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "company_id", null: false
    t.uuid "product_category_id", null: false
    t.uuid "product_type_id", null: false
    t.bigint "product_id", null: false
    t.bigint "vendor_id", null: false
    t.string "address"
    t.uuid "department_id", null: false
    t.uuid "employee_id", null: false
    t.string "description"
    t.string "assign_component"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "asset_id", null: false
    t.index ["asset_id"], name: "index_assign_assets_on_asset_id"
    t.index ["company_id"], name: "index_assign_assets_on_company_id"
    t.index ["department_id"], name: "index_assign_assets_on_department_id"
    t.index ["employee_id"], name: "index_assign_assets_on_employee_id"
    t.index ["product_category_id"], name: "index_assign_assets_on_product_category_id"
    t.index ["product_id"], name: "index_assign_assets_on_product_id"
    t.index ["product_type_id"], name: "index_assign_assets_on_product_type_id"
    t.index ["vendor_id"], name: "index_assign_assets_on_vendor_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "city_name"
    t.bigint "country_id", null: false
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "city_id"
    t.index ["country_id"], name: "index_cities_on_country_id"
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "contact_number"
    t.string "portal_name"
    t.string "industry"
    t.integer "number_of_employees"
    t.string "tax_information"
    t.bigint "country_id", null: false
    t.bigint "state_id", null: false
    t.bigint "city_id", null: false
    t.integer "pin_code"
    t.string "address"
    t.binary "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_companies_on_city_id"
    t.index ["country_id"], name: "index_companies_on_country_id"
    t.index ["state_id"], name: "index_companies_on_state_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "country_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "country_id"
  end

  create_table "departments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "department_name"
    t.string "contact_person_name"
    t.string "contact_person_email"
    t.string "contact_person_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: true
    t.bigint "company_id"
    t.index ["company_id"], name: "index_departments_on_company_id"
  end

  create_table "employees", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "employee_id"
    t.string "phone"
    t.string "location"
    t.string "reporting_manager"
    t.string "department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: true
    t.bigint "location_id"
    t.uuid "department_id"
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["location_id"], name: "index_employees_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "office_name"
    t.string "poc_name"
    t.string "poc_email"
    t.string "poc_contact"
    t.bigint "country_id", null: false
    t.bigint "state_id", null: false
    t.bigint "city_id", null: false
    t.string "zip_code"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_locations_on_city_id"
    t.index ["company_id"], name: "index_locations_on_company_id"
    t.index ["country_id"], name: "index_locations_on_country_id"
    t.index ["state_id"], name: "index_locations_on_state_id"
  end

  create_table "no_of_employees", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "emp_id"
    t.integer "no_of_employee"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "company_id", null: false
    t.integer "notify_id"
    t.string "software_warranty_expiry"
    t.string "hardware_warranty_expiry"
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_notifications_on_company_id"
  end

  create_table "product_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "category_name"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "product_type"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.integer "product_id"
    t.string "product_name"
    t.string "manufacturer"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "product_category_id"
    t.uuid "product_type_id"
    t.index ["company_id"], name: "index_products_on_company_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
  end

  create_table "purchase_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "purchase_type"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "state_name"
    t.integer "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "vendor_name"
    t.string "email"
    t.integer "phone_number"
    t.bigint "country_id", null: false
    t.bigint "state_id", null: false
    t.bigint "city_id", null: false
    t.integer "zip_code"
    t.string "address"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active", default: true, null: false
    t.index ["city_id"], name: "index_vendors_on_city_id"
    t.index ["company_id"], name: "index_vendors_on_company_id"
    t.index ["country_id"], name: "index_vendors_on_country_id"
    t.index ["state_id"], name: "index_vendors_on_state_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "asset_specifications", "companies"
  add_foreign_key "assets", "asset_specifications"
  add_foreign_key "assets", "companies"
  add_foreign_key "assets", "locations"
  add_foreign_key "assets", "product_categories"
  add_foreign_key "assets", "product_types"
  add_foreign_key "assets", "products"
  add_foreign_key "assets", "purchase_types"
  add_foreign_key "assets", "vendors"
  add_foreign_key "assign_assets", "assets"
  add_foreign_key "assign_assets", "companies"
  add_foreign_key "assign_assets", "departments"
  add_foreign_key "assign_assets", "employees"
  add_foreign_key "assign_assets", "product_categories"
  add_foreign_key "assign_assets", "product_types"
  add_foreign_key "assign_assets", "products"
  add_foreign_key "assign_assets", "vendors"
  add_foreign_key "cities", "countries"
  add_foreign_key "cities", "states"
  add_foreign_key "companies", "cities"
  add_foreign_key "companies", "countries"
  add_foreign_key "companies", "states"
  add_foreign_key "departments", "companies"
  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "locations"
  add_foreign_key "locations", "cities"
  add_foreign_key "locations", "companies"
  add_foreign_key "locations", "countries"
  add_foreign_key "locations", "states"
  add_foreign_key "notifications", "companies"
  add_foreign_key "products", "companies"
  add_foreign_key "products", "product_categories"
  add_foreign_key "products", "product_types"
  add_foreign_key "states", "countries"
  add_foreign_key "vendors", "cities"
  add_foreign_key "vendors", "companies"
  add_foreign_key "vendors", "countries"
  add_foreign_key "vendors", "states"
end
