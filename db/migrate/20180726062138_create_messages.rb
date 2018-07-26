class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :buyer, index: true
      t.references :seller, index: true
      t.boolean :sender
      t.text :content
    end
  end
end
