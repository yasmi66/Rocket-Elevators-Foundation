class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|

      t.timestamps
    end
  end
end
