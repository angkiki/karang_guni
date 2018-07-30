class AddAvatarToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :avatar, :string
    add_column :buyers, :avatar, :string

  end
end
