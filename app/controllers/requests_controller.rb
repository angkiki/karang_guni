class RequestsController < ApplicationController
  before_action :only_sellers, only: [:new, :create]

  def index
    @request = Request.includes(:items).where(status: false)
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
