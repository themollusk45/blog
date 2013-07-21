class Link < ActiveRecord::Base
  attr_accessible :text, :url, :user_id, :image
  belongs_to :user
   has_attached_file :logo,
    :url => "/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/:class/:attachment/:id/:style_:basename.:extension"
end
