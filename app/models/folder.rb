require 'open-uri'

class Folder < ApplicationRecord
  belongs_to :user
  has_many :tabs, dependent: :destroy
  validates :name, presence: true #, uniqueness: true;
  validates :name, uniqueness: { scope: :user_id }
  has_one_attached :photo

  # sharing
  has_many :shares, dependent: :destroy
  has_many :users, through: :shares

  after_create :attach_unsplash

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

  def attach_unsplash
    url = "https://source.unsplash.com/1600x900/?nature"
    unless self.photo.attached?
      puts "attaching unsplash photo.."
      self.photo.attach(io: open(url), filename: SecureRandom.hex(8))
    end
  end
end
