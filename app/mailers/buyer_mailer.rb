class BuyerMailer < ApplicationMailer

  def new_request(buyer)
    @buyer = buyer
    mail(to: @buyer.email, subject: 'There Are New Requests!')
  end

  def new_message(buyer, seller, message)
    @buyer = buyer
    @seller = seller
    @message = message
    mail(to: @buyer.email, subject: 'New Message Received!')
  end

  def bid_accepted(request, buyer)
    @request = request
    @buyer = buyer
    mail(to: @buyer.email, subject: 'Your Bid Has Been Accepted!')
  end

  def request_closed(request, buyer)
    @request = request
    @buyer = buyer
    mail(to: @buyer.email, subject: 'The Request Has Been Closed')
  end
end
