class UpdateChatCol < ActiveRecord::Migration[5.2]
  def change
    create_table :message do |t|
      t.text :content
      t.integer :transaction_id
      t.integer :sender_id
      t.integer :receiver_id
      t.boolean :read, :default => false

      t.timestamps
    end
  end
end
