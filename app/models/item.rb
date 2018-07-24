class Item < ApplicationRecord
  belongs_to :request, inverse_of: :items
  validates_presence_of :name, :description, :qty
end
