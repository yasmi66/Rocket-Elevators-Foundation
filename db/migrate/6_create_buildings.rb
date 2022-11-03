class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.bigint :customer_id
      t.bigint :address_id
      t.string "AdressBuilding", limit: 50, null: false
      t.string "FullNameBuildingAdmin", limit: 50, null: false
      t.string "EmailAdminBuilding", limit: 100, null: false
      t.string "PhoneNumberBuildingAdmin", limit: 50, null: false
      t.string "FullNameTechContact", limit: 50, null: false
      t.string "TechContactEmail", limit: 50, null: false
      t.string "TechContactPhone", limit: 500, null: false
      t.timestamps
    end
    add_foreign_key :buildings, :addresses
    add_foreign_key :buildings, :customers
  end
end
