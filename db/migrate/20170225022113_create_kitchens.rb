class CreateKitchens < ActiveRecord::Migration[5.0]
  def change
    create_table :kitchens do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.integer :maxPerson
      t.integer :spaceType
      t.string :equipment
      t.string :opening_time
      t.string :closed_time
      t.string :fare
      t.string :etc
      t.string :notice

      t.timestamps
    end
  end
end
