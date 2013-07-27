class Image < ActiveRecord::Base
  attr_accessible :alt, :user_id, :image_file
  has_attached_file :image_file,
  			styles: {
      			standard: '460x460',#for regular browser
      			mobile: '230x230',#for mobile
            avatar: '64x64' #avatar
    		},
    	:url => "/:class/:attachment/:id/:style_:basename.:extension",
    	:path => ":rails_root/public/:class/:attachment/:id/:style_:basename.:extension"
    
    belongs_to :user

    validates :user_id, presence: true
    validates :image_file, presence: true

    
  validates_attachment_size :image_file, :less_than => 3.megabytes
end
