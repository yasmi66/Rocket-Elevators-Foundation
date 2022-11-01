class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :col_a
      t.string :col_b

      t.timestamps
    end
  end
end
