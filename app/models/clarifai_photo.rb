class ClarifaiPhoto < ActiveRecord::Base
  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "100x100>" },
    url: "/:class/:attachment/:id/:style/:basename.:extension",
    path: ":rails_root/public:url"
  validates_attachment :avatar, presence: true,
    content_type: { content_type: /\Aimage\/.*\Z/ },                          
    size: { in: 0..20.megabyte }

  attr_accessor :image_file_name
  acts_as_taggable
end
