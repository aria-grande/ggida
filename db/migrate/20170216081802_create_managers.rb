class CreateManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :managers do |t|
      t.string :username, null: false, default: ''
      t.timestamps null: false
    end
  end
end
