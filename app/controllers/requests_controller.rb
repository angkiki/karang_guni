class RequestsController < ApplicationController
  before_action :only_sellers, only: [:new, :create]

  def index
    if params[:postal] != nil
      @request = Request.get_nearby_requests(params[:postal])

      if @request == nil
        flash[:danger] = "Error with Google API. Please Try Again Later."
        @request = Request.where(status: false)
      elsif @request.empty?
        flash[:danger] = "No Locations Found Within Your Query. Displaying All Requests."
        @request = Request.where(status: false)
      end
    else
      @request = Request.where(status: false)
    end
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      flash[:success] = "Successfully Saved Requests"
      redirect_to request_index_path

      Request.inform_all_buyers_of_new_request
    else
      flash[:danger] = @request.errors.messages
      render :new
    end
  end

  def show
    @request = Request.includes(:items).find(params[:id])
  end

  private
    def request_params
      params.require(:request).permit(:title, :seller_id, items_attributes: [:id, :name, :description, :qty, :request_id])
    end

    def only_sellers
      unless current_seller
        flash[:danger] = "Unauthorised Access"
        redirect_to root_path
      end
    end
end


# Seller
# Seller.all => SELECTS ALL
# Seller.find => FIND BY SPECIFIC ID
# Seller.find_by => FIND BY A SPECIFIC ATTRIBUTE => gives you the FIRST bryan
# Seller.where => Seller.where(name: 'bryan') => gives you ALL THE BRYANs
