class Item < ApplicationRecord
  belongs_to :request
  validates_presence_of :name, :description, :qty
end
