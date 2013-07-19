class Link < ActiveRecord::Base
  attr_accessible :text, :url, :user_id
  belongs_to :user
end
