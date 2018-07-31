class CreateWallet < ActiveRecord::Migration[5.2]
  def change
    create_table :wallets do |t|
      t.references :seller, index: true
      t.references :buyer, index: true
      t.float :total_amount

      t.timestamps
    end
  end
end
