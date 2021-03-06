class Car < ApplicationRecord
  belongs_to :user
  belongs_to :finance_provider
  has_many_attached :photos
  has_many :transactions, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_make_and_model,
      against: [ :make, :model ],
      using: {
        tsearch: { prefix: true }
      }
  end
