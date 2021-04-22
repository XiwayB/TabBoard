class Folder < ApplicationRecord
  belongs_to :user
  has_many :tabs, dependent: :destroy
  validates :name, presence: true #, uniqueness: true;
  validates :name, uniqueness: { scope: :user_id }
  has_one_attached :photo

  # sharing
  has_many :shares, dependent: :destroy
  has_many :users, through: :shares

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
