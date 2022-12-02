class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.integer :Author
      t.integer :CustomerID
      t.integer :BuildingID
      t.integer :BatteryID
      t.integer :ColumnID
      t.integer :ElevatorID
      t.integer :EmployeeID
      t.datetime :StartDate
      t.datetime :EndDate
      t.string :Result
      t.text :Report
      t.string :Status
      t.timestamps
    end
    add_foreign_key :employees, :elevators, :columns, :batteries, :buildings, :customers, :users
  end
end
