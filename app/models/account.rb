class Account < ActiveRecord::Base
  belongs_to :user

  def <<(val)
    self.credits += read_attribute(:credits) + val
  end
end
