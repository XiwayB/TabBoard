class Share < ApplicationRecord
  belongs_to :folder
  belongs_to :user

  validates :user, presence: true
  validates :folder, presence: true


end
