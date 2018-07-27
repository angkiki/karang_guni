class Request < ApplicationRecord
  belongs_to :seller

  validates_presence_of :title
  has_many :items, inverse_of: :request, dependent: :destroy
  accepts_nested_attributes_for :items, allow_destroy: true

  has_many :buyer_requests
  has_many :buyers, through: :buyer_requests

  def self.inform_all_buyers_of_new_request
    @buyers = Buyer.all
    @buyers.each do |buyer|
      BuyerMailer.new_request(buyer).deliver
    end
  end
end
