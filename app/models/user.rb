# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :logo, :summary, :bio
  #attr_accessor :logo_file_name, :logo_file_size
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :links, dependent: :destroy

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name: "Relationship",
                                   dependent:  :destroy
  has_many :followers, through: :reverse_relationships, source: :follower                                   

  has_attached_file :logo,
    :url => "/:class/:attachment/:id/:style_:basename.:extension",
    :path => ":rails_root/public/:class/:attachment/:id/:style_:basename.:extension"

  #before_save { |user| user.name = name.downcase }
  before_save :create_remember_token

  validates :name,  presence: true, length: { maximum: 50 },
  					uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
  					format: { with: VALID_EMAIL_REGEX }
 # validates :password, presence: true, length: { minimum: 6 }
 # validates :password_confirmation, presence: true  
  validates_attachment_size :logo, :less_than => 3.megabytes




  def feed
    Post.from_users_followed_by(self)#where("user_id = ?", id)
  end

  def following?(other_user)
    relationships.find_by_followed_id( other_user.id)#ffind_by didnt work...
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id( other_user.id).destroy
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end

