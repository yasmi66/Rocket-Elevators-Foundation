class CreateFactElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_elevators do |t|
      t.bigint :serial_number, null: false
      t.datetime :date_commissioning, null: false
      t.bigint :buildingId, null: false
      t.bigint :customerId, null: false
      t.string :city, null: false

      t.timestamps
    end
  end
end
