class AddAttachmentImagesToParties < ActiveRecord::Migration
  def self.up
    change_table :parties do |t|
      t.attachment :images
    end
  end

  def self.down
    remove_attachment :parties, :images
  end
end
