class Tab < ApplicationRecord
  belongs_to :folder
  validates :title, :url, presence: true

  include PgSearch::Model
  pg_search_scope :search_tab,
  against: [:title, :url],
  associated_against: {
    folder: [:name]
  },
  using: {
    # partial words allowed
    tsearch: { prefix: true }
  }

  def to_hashy
    h = serializable_hash
    # { id: ..., title: ...}
    h['folder'] = self.folder.serializable_hash
    h
  end
end
