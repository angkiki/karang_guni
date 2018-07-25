class CreateBuyerRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :buyer_requests do |t|
      t.references :buyer, index: true
      t.references :request, index: true
      t.integer :price
      t.boolean :sold, default: false
    end
  end
end
