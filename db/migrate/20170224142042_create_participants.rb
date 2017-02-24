class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.belongs_to :party, index: true
      t.timestamps
    end
  end
end
