class SellersController < ApplicationController
    before_action :authenticate_seller!

end