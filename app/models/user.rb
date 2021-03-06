class User < ActiveRecord::Base

  include Authority::UserAbilities
  rolify

  #favoriatble
  has_many :favorites, dependent: :destroy

  # relations
  has_many :posts, dependent: :destroy
  has_many :teacher_requests
  has_many :conversations, foreign_key: :sender_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook] #, :google_oauth2

 def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

  def last_teacher_request
    teacher_requests.try(:last)
  end

  def username
    ((first_name.present? and last_name.present?) ? (first_name.capitalize + " " + last_name.capitalize.first + ".") : "Anonyme")
  end

end
