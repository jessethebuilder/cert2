require 'spec_helper'

describe Account do
  let(:account){ build :account }

  describe 'Validations' do

  end

  describe 'Associations' do
    it{ should belong_to :user }
  end

  describe 'Defaults' do

    specify '#debits = 0; #credits = 0' do
      a = Account.new
      a.debits.should == 0
      a.credits.should == 0
    end
  end

  describe 'Methods' do
    describe '<<(val)' do
      it 'should add the amount of #val to #credits' do
        account.credits = 0
        account << 100
        account.credits.should == 100
      end
    end
  end
end
