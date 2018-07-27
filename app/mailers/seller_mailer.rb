class SellerMailer < ApplicationMailer

  def new_bid(buyer_request, seller)
    @bid = buyer_request
    @seller = seller
    mail(to: @seller.email, subject: 'You Have A New Bid!')
  end

  def new_message(buyer, seller, message)
    @buyer = buyer
    @seller = seller
    @message = message
    mail(to: @seller.email, subject: 'New Message Received!')
  end
end
