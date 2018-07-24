class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :seller_id
      t.string :title

      t.timestamps
    end
  end
end
