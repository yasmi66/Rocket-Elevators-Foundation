class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string "type_address"
      t.string "status"
      t.string "entity"
      t.string "number_and_street"
      t.string "suit_or_apartment"
      t.string "city"
      t.string "postal_code"
      t.string "country"
      t.text "notes"
      t.belongs_to :customer
      t.timestamps
    end
  end
end
