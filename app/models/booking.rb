class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :friend
  has_one :review
  validates :start_date, :end_date, presence: true

  def ratable?
    end_date < Date.today && start_date <= Date.today && !review.present?
  end

  def review_display
    if review.present?
      review.rating
    elsif end_date < Date.today
      return
    elsif start_date <= Date.today
      'Enjoy!'
    else
      'Soon!'
    end
  end
end
