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

ActiveRecord::Schema.define(version: 2022_10_26_152010) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
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

  create_table "batteries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "building_id"
    t.string "battery_type"
    t.string "status"
    t.bigint "employee_id"
    t.datetime "date_commissioning"
    t.datetime "date_last_inspection"
    t.string "certificate_operations"
    t.text "information"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "building_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "building_id"
    t.string "information_key"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "fk_rails_51749f8eac"
  end

  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "address_id"
    t.string "AdressBuilding"
    t.string "FullNameBuildingAdmin"
    t.string "EmailAdminBuilding"
    t.string "PhoneNumberBuildingAdmin"
    t.string "FullNameTechContact"
    t.string "TechContactEmail"
    t.string "TechContactPhone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "fk_rails_6dc7a885ab"
    t.index ["customer_id"], name: "fk_rails_c29cbe7fb8"
  end

  create_table "columns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "battery_id"
    t.string "column_type"
    t.integer "served_floors_nb"
    t.string "status"
    t.text "information"
    t.text "notes"
    t.index ["battery_id"], name: "fk_rails_021eb14ac4"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.string "CustomerCreationDate", limit: 50, null: false
    t.string "CompanyName", limit: 50, null: false
    t.string "CompanyHeadquarterAdress"
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

  create_table "elevators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "column_id"
    t.integer "serial_nb"
    t.string "model"
    t.string "elevator_type"
    t.string "elevator_status"
    t.datetime "date_commissioning"
    t.datetime "date_last_inspection"
    t.string "certificate_inspection"
    t.text "information"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "lastName"
    t.string "firstName"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "full_name_contact", limit: 99, null: false
    t.string "company_name", limit: 99, null: false
    t.string "email", limit: 99, null: false
    t.integer "phone", null: false
    t.string "project_name", limit: 99, null: false
    t.string "project_description", null: false
    t.string "departement_in_charge", limit: 99, null: false
    t.string "message"
    t.binary "attached_file", limit: 1
    t.date "date_contact_request", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
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

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
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

  add_foreign_key "building_details", "buildings"
  add_foreign_key "buildings", "addresses"
  add_foreign_key "buildings", "customers"
  add_foreign_key "columns", "batteries"
end
