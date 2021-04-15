class Folder < ApplicationRecord
  belongs_to :user
  has_many :tabs
  validates :name, presence: true
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_folder,
  against: [:name],
  associated_against: {
    tabs: [:title, :url]
  },
  using: {
    # partial words allowed
    tsearch: { prefix: true }
  }
end
