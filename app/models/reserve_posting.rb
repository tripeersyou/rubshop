class ReservePosting < ApplicationRecord
  belongs_to :posting
  belongs_to :seller
end
