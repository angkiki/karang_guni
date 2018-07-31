class UpdateWallet < ActiveRecord::Migration[5.2]
  def change
    add_column :wallets, :buyer_amount, :float
    add_column :wallets, :seller_amount, :float  
  
  end
end
