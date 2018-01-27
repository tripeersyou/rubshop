class Order < ApplicationRecord
  belongs_to :buyer
  belongs_to :seller
  has_many :order_lines
  accepts_nested_attributes_for :order_lines, reject_if: :all_blank,allow_destroy: true
  
  validates_presence_of :order_lines
end