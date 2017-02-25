class RenameFieldsOfParty < ActiveRecord::Migration[5.0]
  def change
    rename_column :parties, :type, :category
  end
end
