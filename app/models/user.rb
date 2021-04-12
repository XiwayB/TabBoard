class User < ApplicationRecord
  has_many :folders, dependent: :destroy
  validates :name, :email, :password, presence: true
end
