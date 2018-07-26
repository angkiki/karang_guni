class BuyersController < ApplicationController
  before_action :only_buyer

  def index
    @buyer = Buyer.find(params[:id])
    # current_buyer => getting back the class instance buyer.find(params[:id])
  end

  def bids
    @requests = current_buyer.requests
  end

  private
    def buyers_params
      params.require(:buyer).permit(:name, :email, :hp)
    end

    def only_buyer
      unless current_buyer
        flash[:danger] = "Unauthorised Access"
        redirect_to root_path
      end
    end
end

# Class.find(id) SELECT * FROM class WHERE id = $1 LIMIT 1;
# Class.find_by(attr:) SELECT * FROM class WHERE attr = $1 LIMIT 1;
# Class.where(attr:) SELECT * FROM class WHERE attr = $1;
# Class.all SELECT * FROM class;

# @buyer = Buyer.find(params[:id])
# /buyer/:id => /buyer/1 => request.params.id => params[:id]

# @buyer = Buyer.find_by(name: "Bryan") # returns the first instance of Buyer named Bryan
# @buyer.name => "Bryan"
# @buyer => { id: 1, name: "Bryan", email: "abc@abc.com", hp: 123 }

# @buyer = Buyer.where(name: "Bryan") # returns an array of buyers named Bryan


# Parameters: {"utf8"=>"✓", "authenticity_token"=>"Rs5UZXfh7xPdej+BF7F+QVr0igQpBrgl0DqN1YL0VvmHD4xgUVU+slxTtvsbkkFoWI62UUnFIdW4STz0/tYdDQ==", "buyer"=>{"email"=>"bryan@gmail.com", "password"=>"[FILTERED]", "remember_me"=>"0"}, "commit"=>"Log in"}
