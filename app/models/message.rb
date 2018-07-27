class Message < ApplicationRecord
  belongs_to :buyer
  belongs_to :seller

  def self.new_message_from_seller(buyer, seller, message)
    BuyerMailer.new_message(buyer, seller, message).deliver
  end

  def self.new_message_from_buyer(buyer, seller, message)
    SellerMailer.new_message(buyer, seller, message).deliver
  end
end
