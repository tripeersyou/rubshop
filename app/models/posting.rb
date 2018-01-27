class Posting < ApplicationRecord
  has_one_attached :picture
  belongs_to :supplier
end
