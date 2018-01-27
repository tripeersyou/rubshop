class Order < ApplicationRecord
  belongs_to :buyer
  has_many :order_lines
  accepts_nested_attributes_for :order_lines, reject_if: :all_blank,allow_destroy: true
end