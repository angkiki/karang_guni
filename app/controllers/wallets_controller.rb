class WalletsController < ApplicationController

    def buyer_wallet
        if current_buyer.wallet == nil
            @buyer_wallet = 0
        else
            @buyer_wallet = current_buyer.wallet.buyer_amount
        end
    end

    def seller_wallet
        if current_seller.wallet == nil
            @seller_wallet = 0
        else
            @seller_wallet = current_seller.wallet.seller_amount
        end
    end

end

# has_many 
# Author #Book


# has_one
# belongs_to 
# has_and_belongs_to_many