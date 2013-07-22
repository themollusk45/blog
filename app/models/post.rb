class Post < ActiveRecord::Base
  attr_accessible :content, :title

  belongs_to :user
  has_many :comments

  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true

  default_scope order: 'posts.created_at DESC'

  #return posts of users being followed
  def self.from_users_followed_by(user)
  	followed_user_ids = "SELECT followed_id FROM relationships
  						WHERE follower_id = :user_id"
  	where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
  			 user_id: user.id)
  end
end

