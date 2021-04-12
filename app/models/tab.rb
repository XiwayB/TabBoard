class Tab < ApplicationRecord
  belongs_to :folder
  validates :title, :url, presence: true
end
