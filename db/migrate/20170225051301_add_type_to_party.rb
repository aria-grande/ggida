class AddTypeToParty < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :type, :string
  end
end
