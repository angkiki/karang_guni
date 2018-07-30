class AddTimestampColToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :created_at, :datetime
  end
end
