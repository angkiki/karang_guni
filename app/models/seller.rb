class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :requests
  has_many :messages

  # Image uploading
  mount_uploader :avatar, AvatarUploader

  #postal gives you back the postal code
  def postal_and_country
    "postal_code: '#{postal}', country: 'SG'"
  end

  geocoded_by :postal_and_country   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def self.notify_buyer_bid_accepted(request, buyer)
    BuyerMailer.bid_accepted(request, buyer).deliver
  end

  def self.notify_buyers_bid_rejected(request, buyer_requests)
    buyer_requests.each do |br|
      BuyerMailer.request_closed(request, br.buyer).deliver
    end
  end

  # Ensuring no size greater then 500KB to be uploader
  
  validates_processing_of :avatar
  validate :avatar_size_validation
    
  private
    
  def avatar_size_validation
    errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  end

end
