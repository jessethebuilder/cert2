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
end
