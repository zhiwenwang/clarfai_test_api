class AddAttachmentAvatarToClarifaiPhotos < ActiveRecord::Migration
  def self.up
    change_table :clarifai_photos do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :clarifai_photos, :avatar
  end
end
