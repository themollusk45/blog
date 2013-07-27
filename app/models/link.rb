class Link < ActiveRecord::Base
  attr_accessible :text, :url, :user_id, :image
  belongs_to :user
   has_attached_file :image, 
   		styles: {
      		small: '64x64',
      		med: '128x128',
            large: '256x256' 
    	},
    :url => "/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/:class/:attachment/:id/:style_:basename.:extension"
end
