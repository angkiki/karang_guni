class MessageController < ApplicationController
    
    def index
        @message= Message.all
    end

    def new
    end

end