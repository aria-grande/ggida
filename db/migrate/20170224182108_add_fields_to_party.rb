class AddFieldsToParty < ActiveRecord::Migration[5.0]
  def change
    remove_column :parties, :end_date
    add_column :parties, :price, :integer, default: 0
  end
end
