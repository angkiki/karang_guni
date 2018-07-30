class Request < ApplicationRecord
  belongs_to :seller

  validates_presence_of :title
  has_many :items, inverse_of: :request, dependent: :destroy
  accepts_nested_attributes_for :items, allow_destroy: true

  has_many :buyer_requests
  has_many :buyers, through: :buyer_requests

  after_create :add_lat_and_lon
  geocoded_by :lat_and_lon

  def lat_and_lon
    [latitude, longitude].compact.join(', ')
  end

  def add_lat_and_lon
    @seller = self.seller
    self.update_attributes(latitude: @seller.latitude, longitude: @seller.longitude)
  end

  def self.inform_all_buyers_of_new_request
    @buyers = Buyer.all
    @buyers.each do |buyer|
      BuyerMailer.new_request(buyer).deliver
    end
  end

  def self.get_nearby_requests(postal)
    begin
      Request.near(postal, 3, units: :km).where(status: false)
    rescue Geocoder::OverQueryLimitError
      begin
        Request.near(postal, 3, units: :km).where(status: false)
      rescue Geocoder::OverQueryLimitError
        Request.where(status: false)
      end
    end
  end
end
