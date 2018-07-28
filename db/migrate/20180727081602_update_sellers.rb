class UpdateSellers < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :postal, :string
  end
end
