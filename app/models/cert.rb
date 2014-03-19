class Cert < ActiveRecord::Base
  include CertsHelper
  SOURCES = %w|facebook twitter email|

  validates :amount, :presence => true, :numericality => {:greater_than => 0}

  belongs_to :receiver, :class_name => 'User'
  belongs_to :giver, :class_name => 'User'

  belongs_to :account

  validates :giver_source, :inclusion => {:in => SOURCES, :allow_nil => true}
  validates :receiver_source, :inclusion => {:in => SOURCES, :allow_nil => true}

  validate :giver_is_identifiable, :receiver_is_identifiable, :amount_is_greater_than_store_minimum,
           :user_is_known_before_credited
  private
    def user_is_known_before_credited
      errors.add(:user, 'cannot be blank') if credited && receiver_id.nil?
    end

    def giver_is_identifiable
      if giver_id.nil?
        errors.add(:giver_source, 'cannot be blank') if giver_source.blank?
        errors.add(:giver_identifier, 'cannot be blank') if giver_identifier.blank?
      end
    end

  def receiver_is_identifiable
    if receiver_id.nil?
      errors.add(:receiver_source, 'cannot be blank') if receiver_source.blank?
      errors.add(:receiver_identifier, 'cannot be blank') if receiver_identifier.blank?
    end
  end

  def amount_is_greater_than_store_minimum
    if cert_store
      errors.add(:amount, "must be more than the minimum of #{cert_store.minimum_certificate_amount}") if amount < cert_store.minimum_certificate_amount
    end
  end
  public

  #Methods
  def credit
    raise(StandardError, 'cannot credit without an authorized receiver account') if account_id.nil?
    account << amount
    self.credited = true
    save
  end


end
