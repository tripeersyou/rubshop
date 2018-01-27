class Product < ApplicationRecord
  has_one_attached :picture
  belongs_to :seller
end
