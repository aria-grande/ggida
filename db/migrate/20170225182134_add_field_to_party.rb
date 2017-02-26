class AddFieldToParty < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :kitchen_id, :integer, default: 0
  end
end
