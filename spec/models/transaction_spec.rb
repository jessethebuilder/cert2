require 'spec_helper'

describe Transaction do
  let(:trans){ build :transaction }
  let(:account){ create :account }

  describe 'Validations' do

  end

  describe 'Associations' do
    it{ should belong_to :account}
  end

  describe 'Methods' do

    describe '#debit' do
      before(:each) do
        trans.account = account
        trans.amount = 100
      end

      it 'should add the amount to #debits on #account' do
        expect{ trans.debit }.to change{ account.debits }.by(100)
      end

      it 'should set #debited to true' do
        expect{ trans.debit }.to change{ trans.debited }.to(true)
      end

      it 'should raise an error if no account exists' do
        trans.account = nil
        expect{ trans.debit }.to raise_error
      end
    end
  end

end
