class SellersController < ApplicationController
  before_action :only_seller

  def index 
    @seller = current_seller
  end

  def request_index
    @requests = current_seller.requests
  end

  def request_bids
    @request = Request.find(params[:req_id])
    @bids = @request.buyer_requests
  end

  def accept_bid
    @bid = BuyerRequest.find(params[:br_id])
    @request = Request.find(params[:req_id])
    
    
    @buyer = @bid.buyer #gets the buyer that place the bid
    @seller = @request.seller #gets the seller request
    @price = @bid.price

    if Wallet.find_by(@buyer.id) == nil
      Wallet.create!(seller_id: @seller, buyer_id: @buyer, total_amount: @price)
    else
      @buyer_amount = Wallet.find(@buyer.id).total_amount
      @buyer_amount -= @price 
      @buyer.wallet.update(total_amount: @buyer_amount)
    end
  
    if Wallet.find_by(@seller.id) == nil
      Wallet.create!(seller_id: @seller, buyer_id: @buyer, total_amount: @price)
    else
      @seller_amount = Wallet.find(@seller.id).total_amount
      @seller_amount += @price 
      @seller.wallet.update(total_amount: @seller_amount)
    end
    
    # get the total amount in the current wallet
    # @total_amount / @price 
    # @total_amount = @total_amount + @price (@total_amount += @price)
    # @total_amount is the updated value
    # @seller.wallet.update(total_amount: @total_amount)

    @bid.update(sold: true)
    @request.update(status: true)

    # we have the buyer
    # we have the price from buyerRequest
    # we want to decrease the price from the buyer's wallet 

    # we have the seller
    # we also have the price
    # we want to increase the price into the seller's wallet 

    # buyer.wallet => give you the buyer's wallet 
    # seller.wallet => give you seller's wallet 

    # both wallets => how much is in their wallet 
    # we have the price
    # buyer's wallet deduct price
    # seller's wallet add price 

    # total amount, belongs to who buyer_id/seller_id 
    # total amount += price 
    # total amount in wallet = current amount + price 
    # wallet.amount => this gives you how much you have
    # wallet.amount += price 
    # object.attribute 
    # wallet.banana
    # classroom.lights 

    @rejected_buyers = @request.buyer_requests.select { |br| !br.sold }

    Seller.notify_buyer_bid_accepted(@request, @buyer)
    Seller.notify_buyers_bid_rejected(@request, @rejected_buyers)

    flash[:success] = "Successfully Accepted #{@buyer.name}'s Bid'"
    redirect_to request_index_path
  end

  private
    def only_seller
      unless current_seller
        flash[:danger] = "Unauthorised Access"
        redirect_to root_path
      end
    end
end
