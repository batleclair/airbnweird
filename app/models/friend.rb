class Friend < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  has_many :users, through: :bookings
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_description_category_language_and_price,
    against: [ :name, :description, :category, :language, :price ],
    using: {
      tsearch: { prefix: true }
    }
end
