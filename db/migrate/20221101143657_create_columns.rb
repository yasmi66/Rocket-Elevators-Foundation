class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.belongs_to :building
      t.belongs_to :employee
      t.string :type
      t.string :status
      t.datetime :date_commissioning
      t.datetime :date_last_inspection
      t.string :certificate_operations
      t.text :information
      t.text :notes
    end

    create_table :columns do |t|
      t.belongs_to :battery
      t.string :type
      t.integer :served_floors_nb
      t.string :status
      t.text :information
      t.text :notes
    end
    
    create_table :elevators do |t|
      t.belongs_to :column
      t.integer :serial_nb
      t.string :model
      t.string :type
      t.datetime :date_commissioning
      t.datetime :date_last_inspection
      t.string :certificate_inspection
      t.text :information
      t.text :notes
      t.timestamps
    end
  end
end
