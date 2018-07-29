class Seller::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    
    super
    permit(:sign_up, keys: [:name, :hp, :address, :postal])
  end
end
