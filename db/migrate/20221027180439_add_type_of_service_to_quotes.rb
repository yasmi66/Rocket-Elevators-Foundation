class AddTypeOfServiceToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :type_of_service, :string
  end
end
