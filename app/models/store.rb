class Store < ActiveRecord::Base
  validates :name, :presence => true

  validates :minimum_certificate_amount, :presence => true, :numericality => {:only_integer => true, :greater_than => 0}

  has_one :social_networking_profile, :as => :has_social_networking

  has_many :addresses, :as => :has_address

  validate :single_store, :on => :create
  private
  def single_store
    errors.add(:store, 'only one store can exist') if Store.count > 0
  end
  public

end

