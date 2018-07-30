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
    @buyer = @bid.buyer

    @bid.update(sold: true)
    @request.update(status: true)

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
