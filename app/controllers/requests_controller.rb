class RequestsController < ApplicationController

  def index
    @request = Request.includes(:items).all
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      flash[:success] = "Successfully Saved Requests"
      redirect_to requests_path
    else
      flash[:danger] = @request.errors.messages
      render :new
    end
  end

  private
    def request_params
      params.require(:request).permit(:title, :seller_id, items_attributes: [:id, :name, :description, :qty, :request_id])
    end
end
