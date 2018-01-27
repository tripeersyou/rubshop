class Posting < ApplicationRecord
  has_one_attached :picture
  belongs_to :supplier
  has_many :reserve_postings
  
  validates :item_type, presence: true
  validates :amount, presence: true
  validates :description, presence: true
  validates_numericality_of :amount, greater_than: 0
end
