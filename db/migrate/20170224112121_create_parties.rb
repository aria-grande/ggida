class CreateParties < ActiveRecord::Migration[5.0]
  def change
    create_table :parties do |t|
      t.string :title, null: false
      t.string :contents, null: false
      t.string :place, null: false
      t.string :contact_number, null: false
      t.string :contact_email
      t.string :address, null: false
      t.integer :state, null: false, default: 0
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.integer :min_participants
      t.integer :max_participants
      t.timestamps
    end
  end
end
