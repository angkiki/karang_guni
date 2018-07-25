class SellersController < ApplicationController
    def index
        @seller = Seller.find(params[:id])
        # current_seller => getting back the class instance Seller.find(params[:id])
    end 

    private

    def sellers_params
        params.require(:seller).permit(:name, :email, :hp)
    end
end
