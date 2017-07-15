class AddAttachmentResumeToProfiles < ActiveRecord::Migration[5.1]
  def self.up
    change_table :profiles do |t|
      t.attachment :resume
    end
  end

  def self.down
    remove_attachment :profiles, :resume
  end
end
