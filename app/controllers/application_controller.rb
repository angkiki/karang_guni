class ApplicationController < ActionController::Base
  require 'buyers/buyer_parameter_sanitizer'
  require 'sellers/seller_parameter_sanitizer'

  protect_from_forgery with: :exception

  protected
    def devise_parameter_sanitizer
      if resource_class == Buyer
        ParameterSanitizer.new(Buyer, :buyer, params)
      elsif resource_class == Seller
        Seller::ParameterSanitizer.new(Seller, :seller, params)
      else
        super # Use the default one
      end
    end

end
