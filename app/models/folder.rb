class Folder < ApplicationRecord
  belongs_to :user
  has_many :tabs
  validates :name, presence: true
end
