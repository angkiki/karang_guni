class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :request, foreign_key: true
      t.string :name
      t.string :description
      t.string :qty

      t.timestamps
    end
  end
end
