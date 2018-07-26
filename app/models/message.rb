class Message < ApplicationRecord
    belongs_to :buyer, :seller
    has_many :messages
  end
  