class SellersController < ApplicationController
  before_action :only_seller

  def request_index
    @requests = current_seller.requests
  end

  def request_bids
    @request = Request.find(params[:req_id])
    @bids = @request.buyer_requests
  end

  private
    def only_seller
      unless current_seller
        flash[:danger] = "Unauthorised Access"
        redirect_to root_path
      end
    end
end
