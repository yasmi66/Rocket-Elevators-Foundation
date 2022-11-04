class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|

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

      t.timestamps
    end
  end
end
