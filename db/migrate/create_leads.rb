class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string "full_name_contact"
      t.string "company_name"
      t.string "email"
      t.integer "phone"
      t.string "project_name"
      t.string "project_description"
      t.string "departement_in_charge"
      t.string "message"
      t.binary "attached_file", limit: 1
      t.date "date_contact_request"
      t.timestamps
    end
  end
end
