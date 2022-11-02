class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.belongs_to :battery
      t.string :type
      t.integer :served_floors_nb
      t.string :status
      t.text :information
      t.text :notes
    end
  end
end
