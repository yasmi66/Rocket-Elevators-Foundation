class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.bigint :column_id
      t.integer :serial_nb
      t.string :model
      t.string :elevatorType
      t.datetime :date_commissioning
      t.datetime :date_last_inspection
      t.string :certificate_inspection
      t.text :information
      t.text :notes
      t.timestamps
    end
    add_foreign_key :elevators, :columns
  end
end
