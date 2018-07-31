class AddDefaultValueToMessages < ActiveRecord::Migration[5.2]
  def change
    change_column :messages, :created_at, :datetime, null: false
  end
end
