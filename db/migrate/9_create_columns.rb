class CreateColumns < ActiveRecord::Migration[5.2]
<<<<<<< HEAD
=======
  
>>>>>>> a9daeb9eabffb946a230306c886bb8b5d262cff4
  def change
    create_table :columns do |t|
      t.bigint :battery_id
      t.string :type
      t.integer :served_floors_nb
      t.string :status
      t.text :information
      t.text :notes
<<<<<<< HEAD
=======
      
      t.timestamps
>>>>>>> a9daeb9eabffb946a230306c886bb8b5d262cff4
    end
    add_foreign_key :columns, :batteries
  end
end
