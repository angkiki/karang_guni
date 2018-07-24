class Request < ApplicationRecord
  validates_presence_of :title
  has_many :items, inverse_of: :request, dependent: :destroy
  accepts_nested_attributes_for :items, allow_destroy: true
end
