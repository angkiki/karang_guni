class MessagesController < ApplicationController
  before_action :only_buyer, only: [:buyer_new, :buyer_show]
  before_action :only_seller, only: [:seller_new, :seller_show]

  def buyer_new
    @message = Message.new
    @buyer = current_buyer
    @seller = Seller.find(params[:seller_id])
  end

  def seller_new
    @message = Message.new
    @seller = current_seller
    @buyer = Buyer.find(params[:buyer_id])
  end

  def create
    @message = Message.new(message_params)
    @message.save

    if current_buyer
      redirect_to show_buyer_message_path
      @seller = Seller.find(message_params[:seller_id])
      Message.new_message_from_seller(current_buyer, @seller, @message)
    else
      redirect_to show_seller_message_path
      @buyer = Buyer.find(message_params[:buyer_id])
      Message.new_message_from_seller(@buyer, current_seller, @message)
    end
  end

  def seller_show
    @sellers_messages = current_seller.get_sellers_messages
  end

  def buyer_show
    @buyers_messages = current_buyer.get_buyers_messages
  end

  private
    def message_params
      params.require(:message).permit(:content, :sender, :buyer_id, :seller_id)
    end

    def only_buyer
      unless current_buyer
        flash[:danger] = "Unauthorised Access"
        redirect_to root_path
      end
    end

    def only_seller
      unless current_seller
        flash[:danger] = "Unauthorised Access"
        redirect_to root_path
      end
    end
end
