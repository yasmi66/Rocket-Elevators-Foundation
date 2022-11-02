class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.bigint :building_id
      t.bigint :employee_id
      t.belongs_to :employee
      t.string :type
      t.string :status
      t.datetime :date_commissioning
      t.datetime :date_last_inspection
      t.string :certificate_operations
      t.text :information
      t.text :notes
      t.timestamps
    end
    add_foreign_key :batteries, buildings
    add_foreign_key :batteries, employees
  end
end
