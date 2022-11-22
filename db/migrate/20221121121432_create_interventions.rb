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
      t.string :StartDate
      t.string :EndDate
      t.string :Result
      t.string :Report
      t.string :Status

      t.timestamps
    end
  end
end
