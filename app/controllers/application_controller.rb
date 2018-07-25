class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
    def devise_parameter_sanitizer
      if resource_class == Buyer
        Buyer::ParameterSanitizer.new(Buyer, :buyer, params)
      elsif resource_class == Seller
        Seller::ParameterSanitizer.new(Seller, :seller, params)
      else
        super # Use the default one
      end
    end
  
end
