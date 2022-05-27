class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, inclusion: { in: (1..5) }
  validates :rating, presence: true
end
