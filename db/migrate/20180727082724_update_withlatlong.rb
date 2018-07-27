class UpdateWithlatlong < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :latitude, :float
    add_column :sellers, :longitude, :float
  end
end
