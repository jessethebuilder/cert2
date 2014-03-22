class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :presence => true

  has_many :certs

  has_many :addresses, :as => :has_address

  has_one :account

  def User.admins
    where(:admin => true)
  end

  def User.not_opted_out
    where(:opt_out => nil)
  end

  def User.parse_omniauth(omniauth_hash, user = nil)
    user ||= find_omniauth_authorized_user_or_build(omniauth_hash)
    user.password = temp_pass if user.new_record?
    user.parse_from_omniauth(omniauth_hash)
  end

  def parse_from_omniauth(omniauth_hash)
    self.provider = omniauth_hash.provider
    self.uid = omniauth_hash.uid
    self.name = omniauth_hash.info.name
    self.email = omniauth_hash.info.email if read_attribute(:email).blank?
    self.facebook_image = omniauth_hash.info.image
    self.oauth_token = omniauth_hash.credentials.token
    self.oauth_expires_at = Time.at(omniauth_hash.credentials.expires_at)
    self
  end

  private

  def User.temp_pass
    '!!!123tEMPORarYPAsswordFORDevIsEujhn98jak124'
  end

  def User.find_omniauth_authorized_user_or_build(omniauth_hash)
    user = where(omniauth_hash.slice(:provider, :uid)).first
    user ||= where(:email => omniauth_hash.info.email).first
    user ||= User.new
    user
  end
end
