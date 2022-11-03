# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_11_01_183122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "type_address", null: false
    t.string "status", null: false
    t.string "entity", null: false
    t.string "number_and_street", null: false
    t.string "suit_or_apartment"
    t.string "city", null: false
    t.string "postal_code", null: false
    t.string "country", null: false
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "batteries", force: :cascade do |t|
    t.bigint "building_id"
    t.bigint "employee_id"
    t.string "batteryType"
    t.string "status"
    t.datetime "date_commissioning"
    t.datetime "date_last_inspection"
    t.string "certificate_operations"
    t.text "information"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_batteries_on_employee_id"
  end

  create_table "building_details", force: :cascade do |t|
    t.bigint "building_id"
    t.string "information_key"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buildings", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "address_id"
    t.string "AdressBuilding", limit: 50, null: false
    t.string "FullNameBuildingAdmin", limit: 50, null: false
    t.string "EmailAdminBuilding", limit: 100, null: false
    t.string "PhoneNumberBuildingAdmin", limit: 50, null: false
    t.string "FullNameTechContact", limit: 50, null: false
    t.string "TechContactEmail", limit: 50, null: false
    t.string "TechContactPhone", limit: 500, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "columns", force: :cascade do |t|
    t.bigint "battery_id"
    t.string "type"
    t.integer "served_floors_nb"
    t.string "status"
    t.text "information"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "address_id"
    t.string "CustomerCreationDate", limit: 50, null: false
    t.string "CompanyName", limit: 50, null: false
    t.string "CompanyHeadquarterAdress", limit: 100, null: false
    t.string "FullNameCompanyContact", limit: 50, null: false
    t.string "CompanyContactPhone", limit: 50, null: false
    t.string "EmailCompanyContact", limit: 50, null: false
    t.string "CompanyDescription", limit: 500, null: false
    t.string "FullNameServiceTechnicalAuth", limit: 50, null: false
    t.string "TechnicalAuthorityPhoneService", limit: 50, null: false
    t.string "TechnicalManagerEmailService", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "elevators", force: :cascade do |t|
    t.bigint "column_id"
    t.integer "serial_nb"
    t.string "model"
    t.string "elevatorType"
    t.datetime "date_commissioning"
    t.datetime "date_last_inspection"
    t.string "certificate_inspection"
    t.text "information"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "lastName"
    t.string "firstName"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leads", force: :cascade do |t|
    t.string "contactName", limit: 99, null: false
    t.string "contactBuisnessName", limit: 99, null: false
    t.string "contactEmail", limit: 99, null: false
    t.string "contactPhone", null: false
    t.string "contactProject", limit: 99, null: false
    t.string "project_description"
    t.string "contactDepartement", limit: 99, null: false
    t.string "contactMessage"
    t.binary "contactAttachment"
    t.date "contactDate", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.string "buildingType"
    t.integer "nbrAppBuild"
    t.integer "nbrFloorsR"
    t.integer "nbrFloorsC"
    t.integer "nbrFloorsCor"
    t.integer "nbrFloorsH"
    t.integer "nbrBasementFloorsR"
    t.integer "nbrBasementFloorsC"
    t.integer "nbrBasementFloorsCor"
    t.integer "nbrBasementFloorsH"
    t.integer "nbrDisBuiCor"
    t.integer "nbrDisBuiH"
    t.integer "nbrParkingC"
    t.integer "nbrParkingCor"
    t.integer "nbrParkingH"
    t.integer "nbrElevatorCages"
    t.integer "nbrOccPerFloorCor"
    t.integer "nbrOccPerFloorH"
    t.integer "nbrActPerDay"
    t.string "serviceType"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string "col_a"
    t.string "col_b"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "batteries", "buildings"
  add_foreign_key "batteries", "employees"
  add_foreign_key "building_details", "buildings"
  add_foreign_key "buildings", "addresses"
  add_foreign_key "buildings", "customers"
  add_foreign_key "columns", "batteries"
  add_foreign_key "customers", "addresses"
  add_foreign_key "customers", "users"
  add_foreign_key "elevators", "columns"
end
