class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :requests
  has_many :messages

  #postal gives you back the postal code
  def postal_and_country
    "postal_code: '#{postal}', country: 'SG'"
  end

  geocoded_by :postal_and_country   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

end
