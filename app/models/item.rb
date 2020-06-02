class Item < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }
end
