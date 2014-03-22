class Account < ActiveRecord::Base
  belongs_to :user

  has_many :transactions
  has_many :certs

  def <<(val)
    self.credits += read_attribute(:credits) + val
  end

  def >>(val)
    self.debits += read_attribute(:debits) + val
  end
end
