class Buyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :buyer_requests
  has_many :requests, through: :buyer_requests
  has_many :messages

  # Image uploading
  mount_uploader :avatar, AvatarUploader

  # Ensuring no size greater then 500KB to be uploader
  validates_processing_of :avatar
  validate :avatar_size_validation
  
  private
    def avatar_size_validation
      errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
    end
end
