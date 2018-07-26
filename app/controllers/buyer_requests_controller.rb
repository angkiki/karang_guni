class BuyerRequestsController < ApplicationController
  before_action :only_buyer
  before_action :cannot_bid_twice, only: [:new]

  def new
    @buyer_request = BuyerRequest.new
    @req_id = params[:req_id]
  end

  def create
    @buyer_request = BuyerRequest.new(buyer_request_params)

    if @buyer_request.save
      flash[:success] = "Successfully Submitted Bid!"
      redirect_to requests_path
    else
      flash[:danger] = @buyer_request.errors.messages
      redirect_to new_buyer_request_path(req_id: params[:req_id])
    end
  end

  private
    def buyer_request_params
      params.require(:buyer_request).permit(:buyer_id, :request_id, :price)
    end

    def only_buyer
      unless current_buyer
        flash[:danger] = "Unauthorised Access"
        redirect_to root_path
      end
    end

    def cannot_bid_twice
      @bid = BuyerRequest.find_by(buyer_id: current_buyer.id, request_id: params[:req_id])
      if @bid != nil
        flash[:danger] = "You Can Only Bid Once!"
        redirect_to requests_path
      end
    end
end
