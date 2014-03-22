class Transaction < ActiveRecord::Base
  belongs_to :account

  def debit
    raise StandardError, 'cannot debit without an account' if account_id.nil?
    account >> amount
    self.debited = true
  end
end
