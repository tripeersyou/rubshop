class Posting < ApplicationRecord
  has_one_attached :picture
  belongs_to :supplier
  has_many :reserve_postings
end
