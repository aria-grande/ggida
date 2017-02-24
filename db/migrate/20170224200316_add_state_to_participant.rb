class AddStateToParticipant < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :state, :integer, default: 0
  end
end
