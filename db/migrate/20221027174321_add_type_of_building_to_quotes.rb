class AddTypeOfBuildingToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :type_of_building, :string
  end
end
