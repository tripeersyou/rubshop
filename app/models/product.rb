class Product < ApplicationRecord
  has_one_attached :picture
  belongs_to :seller
  
  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :description, presence: true

  validates_numericality_of :price, greater_than: 0
end
