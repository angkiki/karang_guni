class MessagesController < ApplicationController
    
    def index
        if @messages == nil
            @messages = [{:content => 'No messages'}]
        else
            @message= Message.all
        end
    end

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

        redirect_to messages_path
    end

    def seller_show
        @seller = current_seller
        @messages = Message.where(seller_id: @seller.id, sender: 'false')
    end

    def buyer_show
        @buyer = current_buyer
        @messages = Message.where(buyer_id: @buyer.id, sender: 'true')
    end
    
    private
    def message_params
        params.require(:message).permit(:content, :sender, :buyer_id, :seller_id)
    end

end