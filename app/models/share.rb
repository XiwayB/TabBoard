class Share < ApplicationRecord
  belongs_to :folder, :user

  validates :user, presence: true
  validates :folder, presence: true


end
