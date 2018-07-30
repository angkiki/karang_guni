class Buyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :buyer_requests
  has_many :requests, through: :buyer_requests
  has_many :messages

  def get_buyers_messages
    @b_id = self.id
    @sellers = self.messages.map { |m| m.seller }.uniq
    @messages = @sellers.map do |seller|
      seller.messages.where(buyer_id: @b_id)
    end
    [@sellers, @messages]
  end
end
