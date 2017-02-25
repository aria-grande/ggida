class AddNameToParty < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :applier_name, :string, null: false
  end
end
