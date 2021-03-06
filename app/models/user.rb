class User < ApplicationRecord
has_many :authentication_tokens
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :token_authenticatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

  has_many :folders
  has_many :tabs, through: :folders
  after_create :create_default_folder

  def create_default_folder
    puts "creating default folder"
    Folder.create!(name: "Default", user: self)
  end

  def self.from_omniauth(auth)
    p auth
    # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    where(email: auth.info.email).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

end
