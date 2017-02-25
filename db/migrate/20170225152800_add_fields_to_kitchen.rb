class AddFieldsToKitchen < ActiveRecord::Migration[5.0]
  def change
    add_column :kitchens, :latitute, :double, default: 0
    add_column :kitchens, :longitute, :double, default: 0
  end
end
