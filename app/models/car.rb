class Car < ApplicationRecord
  belongs_to :user
  belongs_to :finance_provider
  has_one_attached :photo
  has_many :transactions

  include PgSearch::Model
  pg_search_scope :search_by_make_and_model,
      against: [ :make, :model ],
      using: {
        tsearch: { prefix: true }
      }
  end
