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

ActiveRecord::Schema.define(version: 2022_10_26_155117) do

  create_table "articles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "title"
    t.text "body"
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

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "nbrAppBuild"
    t.integer "NbrFloors"
    t.integer "nbrBasementFloors"
    t.integer "nbrDisBui"
    t.integer "nbrParking"
    t.integer "nbrElevatorCages"
    t.integer "nbrOccPerFloor"
    t.integer "nbrActPerDay"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "technical_estimates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "nbrElevatorRecommended"
    t.integer "nbrUnitPrice"
    t.integer "nbrPriceOfElevator"
    t.integer "nbrCostOfInstallation"
    t.integer "nbrTotal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_of_buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.boolean "residential"
    t.boolean "commercial"
    t.boolean "corporate"
    t.boolean "hybrid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_of_services", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.boolean "standard"
    t.boolean "premium"
    t.boolean "excelium"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
