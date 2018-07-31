class Message < ApplicationRecord
  belongs_to :buyer
  belongs_to :seller

  before_create :add_date_time

  def self.new_message_from_seller(buyer, seller, message)
    BuyerMailer.new_message(buyer, seller, message).deliver
  end

  def self.new_message_from_buyer(buyer, seller, message)
    SellerMailer.new_message(buyer, seller, message).deliver
  end

  private
    def add_date_time
      created_at = DateTime.now
    end
end
