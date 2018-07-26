class MessagesController < ApplicationController
    
    def index
        @messages = Message.all
    end

    def buyer_new
        @sender_id = current_buyer
    end

    def seller_new
        @sender_id = current_seller     
    end

    def create
        
    end

end