class User < ApplicationRecord
  has_many :folders, dependent: :destroy
  has_many :tabs, through: :folders
  validates :name, :email, :password, presence: true
end
